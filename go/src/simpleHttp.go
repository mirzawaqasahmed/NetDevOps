package main

import (
    "log"
    "flag"
    "net/http"
)

var dirFlag = flag.String("directory","","Specify directory to serve")

func Log(handler http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        log.Printf("%s %s %s %s", r.RemoteAddr, r.Method, r.URL)
        handler.ServeHTTP(w, r)
    })
}

func init() {
    flag.StringVar(dirFlag,"d","","Specify directory to serve")
}

func main() {
    // Simple static webserver:
    flag.Parse()
    log.Fatal(http.ListenAndServe(":8080", Log(http.FileServer(http.Dir(*dirFlag)))))
}
