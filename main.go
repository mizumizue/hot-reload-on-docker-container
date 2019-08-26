package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	_, _ = fmt.Fprintf(w, "Request recieved. Request: %+v. Your go version is %s", r, os.Getenv("GOLANG_VERSION"))
}

func main() {
	http.HandleFunc("/", handler)
	_ = http.ListenAndServe(":8080", nil)
}
