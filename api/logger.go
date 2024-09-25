package main

import (
	"fmt"
	"os"
	"time"
)

var logger = Logger{}

type Logger struct {
}

func (l *Logger) Debug(format string, v ...any) {
	fmt.Printf("DEBUG"+": "+time.Now().UTC().Format(time.RFC3339)+": "+format+"\n", v...)
}

func (l *Logger) Info(format string, v ...any) {
	fmt.Printf("INFO"+": "+time.Now().UTC().Format(time.RFC3339)+": "+format+"\n", v...)
}

func (l *Logger) Warn(format string, v ...any) {
	fmt.Printf("WARN"+": "+time.Now().UTC().Format(time.RFC3339)+": "+format+"\n", v...)
}

func (l *Logger) Error(format string, v ...any) {
	fmt.Printf("ERROR"+": "+time.Now().UTC().Format(time.RFC3339)+": "+format+"\n", v...)
}

func (l *Logger) Fatal(v ...any) {
	s := fmt.Sprint(v...)
	fmt.Printf("FATAL" + ": " + time.Now().UTC().Format(time.RFC3339) + ": " + s + "\n")
	os.Exit(1)
}

func (l *Logger) Panic(v ...any) {
	s := fmt.Sprint(v...)
	fmt.Printf("PANIC" + ": " + time.Now().UTC().Format(time.RFC3339) + ": " + s + "\n")
	panic(s)
}
