package main

import (
	"flag"
	"log"
	"net/http"

	"github.com/google/uuid"
	"github.com/gorilla/websocket"
	"github.com/koki-morino/mweb/middleware"
	"github.com/koki-morino/mweb/protos"
	"google.golang.org/protobuf/proto"
)

// Upgrader with default config.
var upgrader = websocket.Upgrader{}

func main() {
	flag.Parse()
	log.SetFlags(0)

	mux := http.NewServeMux()

	mux.HandleFunc("/ping", ping)
	mux.HandleFunc("/ws", ws)

	wrappedMux := middleware.NewLogger(mux)

	kvs, err := middleware.NewKvs()
	if err != nil {
		log.Fatal(err)
	}

	if err := kvs.Write(); err != nil {
		log.Fatal(err)
	}

	log.Fatal(http.ListenAndServe(":8000", wrappedMux))
}

func ping(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("pong"))
}

func ws(w http.ResponseWriter, r *http.Request) {
	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println("Failed to upgrade websocket connection:", err)
		return
	}
	defer c.Close()

	id := uuid.New()
	todo := &protos.Todo{Id: id.String(), Title: "Hello", Description: "Hello, world!", Completed: false}
	out, err := proto.Marshal(todo)
	if err != nil {
		log.Println("Failed to marshall proto message:", err)
		return
	}

	c.WriteMessage(websocket.BinaryMessage, out)
}
