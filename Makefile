VERSION=0.0.1
LDFLAGS=-ldflags "-w -s -X main.version=${VERSION}"
all: mackerel-plugin-pdns

.PHONY: mackerel-plugin-pdns

mackerel-plugin-pdns: cmd/mackerel-plugin-pdns/main.go
	go build $(LDFLAGS) -o mackerel-plugin-pdns cmd/mackerel-plugin-pdns/main.go

linux: cmd/mackerel-plugin-pdns/main.go
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o mackerel-plugin-pdns cmd/mackerel-plugin-pdns/main.go

fmt:
	go fmt ./...

check:
	go test ./...

clean:
	rm -rf mackerel-plugin-pdns

tag:
	git tag v${VERSION}
	git push origin v${VERSION}
	git push origin main