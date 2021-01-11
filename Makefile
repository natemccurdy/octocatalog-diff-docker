IMAGE_NAME := natemccurdy/octocatalog-diff

.PHONY: build

build:
	docker build --rm -t $(IMAGE_NAME) -f Dockerfile .
