package main

import (
	"flag"
	"net/http"
	"strings"

	"github.com/google/uuid"
	"github.com/gorilla/websocket"
	"github.com/koki-morino/mweb/protos"
	"google.golang.org/protobuf/proto"
)

// Upgrader with default config.
var upgrader = websocket.Upgrader{CheckOrigin: func(r *http.Request) bool {
	host := r.Host
	if idx := strings.IndexByte(host, ':'); idx >= 0 {
		host = r.Host[:idx]
	}

	logger.Debug(host)
	// TODO: Use environment variable.
	return host == "localhost"
}}

func main() {
	flag.Parse()

	http.HandleFunc("/ping", ping)
	http.HandleFunc("/ws", ws)

	kvs, err := NewKvs()
	if err != nil {
		logger.Fatal(err)
	}

	if err := kvs.Write(); err != nil {
		logger.Fatal(err)
	}

	logger.Info("Listening to http://localhost:8000")
	if err := http.ListenAndServe(":8000", nil); err != nil {
		logger.Fatal(err)
	}
}

func ping(w http.ResponseWriter, r *http.Request) {
	logger.Info("%s %s", r.Method, r.URL.Path)

	w.Write([]byte("pong"))
}

func ws(w http.ResponseWriter, r *http.Request) {
	logger.Info("%s %s", r.Method, r.URL.Path)

	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		logger.Error("%s", err)
		return
	}
	defer c.Close()

	id := uuid.New()
	todo := &protos.Todo{Id: id.String(), Title: "Hello", Description: "Hello, world!", IsCompleted: false}
	_, err = proto.Marshal(todo)
	if err != nil {
		logger.Error("%s", err)
		return
	}

	for {
		mt, message, err := c.ReadMessage()
		if err != nil {
			logger.Error("%s", err)
			break
		}

		if mt == 1 {
			logger.Debug("Received: %s", message)
		}

		err = c.WriteMessage(1, []byte("Pong"))
		if err != nil {
			logger.Error("%s", err)
			break
		}
	}
}
