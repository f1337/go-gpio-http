package main

import (
  "net/http"
  "github.com/gorilla/mux"
  "handlers/gpio"
)

func main () {
  r := mux.NewRouter()

  // GPIO API
  r.HandleFunc("/{id}", gpio.Show).Methods("GET")
  r.HandleFunc("/{id}", gpio.Update).Methods("PUT")

  http.ListenAndServe(":8000", r)
}
