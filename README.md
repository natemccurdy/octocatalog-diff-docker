# Octocatalog-diff in Docker
[![Docker Image Version](https://img.shields.io/docker/v/natemccurdy/octocatalog-diff?logo=docker)](https://hub.docker.com/r/natemccurdy/octocatalog-diff)

This repo provides a Dockerfile for building an image with [`octocatalog-diff`](https://github.com/github/octocatalog-diff) installed in it.

I used this to run `octocatalog-diff` in places where installing and running a Gem may be troublesome (like in CI systems, locked down laptops, etc...).

## Using the image

To pass two pre-compiled catalogs, mount a directory containing the catalogs to `/code` in the container:
```
> docker run --rm -v ~/catalogs:/code  natemccurdy/octocatalog-diff --from-catalog /code/catalog-a.json --to-catalog /code/catalog-b.json
I, [2021-06-22T20:44:40.884798 #1]  INFO -- : Catalogs compiled for foo.bar.net
I, [2021-06-22T20:44:47.388317 #1]  INFO -- : Diffs computed for foo.bar.net
I, [2021-06-22T20:44:47.388382 #1]  INFO -- : No differences
```

The image is setup to run `octocatalog-diff` directly, so you can pass arbitrary commands and options to it. For example:
```
> docker run --rm natemccurdy/octocatalog-diff --version
octocatalog-diff 2.1.0
```

## Building the image

The Makefile has a `build` task for building the image:
```
make build
```
