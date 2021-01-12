FROM ruby:2.5-alpine AS builder

WORKDIR /tmp

COPY Gemfile Gemfile.lock ./

RUN bundle config --global frozen 1 \
  && apk add --no-cache \
  make=4.3-r0 \
  cmake=3.17.2-r0 \
  gcc=9.3.0-r2 \
  g++=9.3.0-r2 \
  openssl-dev=1.1.1i-r0 \
  && bundle install

FROM ruby:2.5-alpine
LABEL maintainer="Nate McCurdy, @natemccurdy"
LABEL octocatalog-diff-version="2.0.0"

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

VOLUME /code
WORKDIR /code

ENTRYPOINT ["octocatalog-diff"]
