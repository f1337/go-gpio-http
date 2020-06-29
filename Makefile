remote_host := pi.local
remote_path := /home/pi/
remote_user := pi
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

default: build compile
.PHONY: default

.PHONY: build
build:
	@echo 'building image...'
	docker build -q -t gpio-http .

.PHONY: compile
compile:
	@echo 'compiling script...'
	docker run --rm -v "$(current_dir)":/go/src/app -e GOARM=6 -e GOARCH=arm -e GOOS=linux gpio-http go build gpio-http.go

.PHONY: install
install:
	@echo "copying to $(remote_host)..."
	scp gpio-http $(remote_user)@$(remote_host):$(remote_path)

.PHONY: run
run:
	@echo "running on $(remote_host)..."
	ssh -t $(remote_user)@$(remote_host) 'sudo ./gpio-http'
