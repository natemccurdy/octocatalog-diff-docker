FROM ruby:2.5.9-alpine AS builder

WORKDIR /tmp

COPY Gemfile Gemfile.lock ./

RUN bundle config --global frozen 1 \
  && apk add --no-cache \
  make=4.3-r0 \
  cmake=3.18.4-r1 \
  gcc=10.2.1_pre1-r3 \
  g++=10.2.1_pre1-r3 \
  openssl-dev=1.1.1k-r0 \
  && bundle install

FROM ruby:2.5.9-alpine
LABEL maintainer="Nate McCurdy, @natemccurdy"
LABEL octocatalog-diff-version="2.1.0"

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

VOLUME /code
WORKDIR /code

ENTRYPOINT ["octocatalog-diff"]
