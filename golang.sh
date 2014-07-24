#!/bin/sh

# make folders
mkdir -p ~/src/gocode/src ~/src/gocode/bin ~/src/gocode/pkg

# install stuff
go get code.google.com/p/go.tools/cmd/godoc
go get code.google.com/p/go.tools/cmd/vet
go get github.com/nsf/gocode
go get code.google.com/p/go.tools/cmd/goimports
go get code.google.com/p/rog-go/exp/cmd/godef
go get code.google.com/p/go.tools/cmd/oracle
go get github.com/golang/lint/golint
go get github.com/kisielk/errcheck
go get github.com/jstemmer/gotags

