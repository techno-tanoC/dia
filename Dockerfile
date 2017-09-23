FROM ruby:2.4.2-alpine3.6

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update\
    bash \
    build-base \
    curl-dev \
    git \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    nodejs \
    openssh \
    ruby-dev \
    ruby-json \
    tzdata \
    yaml \
    yaml-dev \
    zlib-dev

RUN apk add --update sqlite-dev

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install --jobs 4 --without development test --with production

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

ADD . .

RUN bundle exec rails assets:precompile
