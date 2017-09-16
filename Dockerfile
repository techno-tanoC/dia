FROM ruby:2.4.1

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD . .
