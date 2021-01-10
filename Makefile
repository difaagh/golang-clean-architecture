GOPATH=$(shell pwd)/vendor:$(shell pwd)
GOBIN=$(shell pwd)/bin
GOFILES=$(wildcard *.go)
GONAME=$(shell basename "$(PWD)")
build:
	@echo "Building $(GOFILES) to ./bin"
	@GOPATH=$(GOPATH) GOBIN=$(GOBIN) go build -o bin/$(GONAME) $(GOFILES)

clean:
	@echo "Cleaning binary file and cached file..."
	@rm -rf ./bin/${GONAME}
	@go clean -i

start:
	@if test -f bin/$(GONAME); \
	then echo "Stating Application..." & ./bin/$(GONAME); \
	else echo "Binary not exists,Run: make build"; fi 

help:
	@echo "build: compile packages and dependencies"
	@echo "make lint: golint ./..."
	@echo "make clean: remove object files and cached files"


