package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request){
	fmt.Fprintln(w, "Hello, World checking merge conflict!")
}

func main(){

	http.HandleFunc("/", handler)

	log.Fatal(http.ListenAndServe(":8080", nil)) // http.ListenAndServe(":8080", nil)

}