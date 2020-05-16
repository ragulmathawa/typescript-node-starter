VERSION := $(shell git describe || echo '1.0.0')
HASH:=$(shell git log -1 --format=%h)
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD | sed -e 's/[\/-]/_/g' )
GIT_BRANCH:=master
build:
	docker build --network host -t typescript-node-starter-$(GIT_BRANCH):$(VERSION) .