package main

import (
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
)

func main() {
	PATH_RAY := os.Getenv("PATH_RAY")
	PATH_DOC := os.Getenv("PATH_DOC")
	URL_DISGUISE := os.Getenv("URL_DISGUISE")

	http.HandleFunc(PATH_RAY, func(w http.ResponseWriter, r *http.Request) {
		director := func(req *http.Request) {
			req.Host = "127.0.0.1:10000"
		}
		proxy := &httputil.ReverseProxy{Director: director}
		proxy.ServeHTTP(w, r)
	})

	http.HandleFunc(PATH_DOC+"/", func(w http.ResponseWriter, r *http.Request) {
		director := func(req *http.Request) {
			req.Host = "pch18-docker.github.io"
			req.URL.Scheme = "https"
			req.URL.Host = "pch18-docker.github.io"
			req.URL.Path = "/v2ray" + req.URL.Path[len(PATH_DOC):]
		}
		proxy := &httputil.ReverseProxy{Director: director}
		proxy.ServeHTTP(w, r)
	})

	disguiseUrl, _ := url.Parse(URL_DISGUISE)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		director := func(req *http.Request) {
			req.Host = disguiseUrl.Host
			req.URL.Scheme = disguiseUrl.Scheme
			req.URL.Host = disguiseUrl.Host
		}
		proxy := &httputil.ReverseProxy{Director: director}
		proxy.ServeHTTP(w, r)
	})
	log.Fatal(http.ListenAndServe("0.0.0.0:8888", nil))
}
