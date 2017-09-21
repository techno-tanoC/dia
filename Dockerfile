FROM ruby:2.4.1

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD . .

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

RUN bundle exec rails assets:precompile
