FROM ruby:2.4.2-alpine3.6

RUN \
  apk update && \
  apk upgrade && \
  apk add --update --no-cache libxml2-dev libxslt-dev tzdata sqlite-dev nodejs yarn

ENV DEV_PACKAGES "build-base"

RUN mkdir /app
WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .

RUN \
  apk add --update --no-cache --virtual build-dependencies $DEV_PACKAGES && \
  gem install bundler --no-document && \
  bundle config build.nokogiri --use-system-libraries && \
  bundle install --jobs 4 --without development test --with production && \
  apk del build-dependencies

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE "!!!SET_ME!!!"

ADD . .

RUN bundle exec rails assets:precompile
