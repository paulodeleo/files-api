FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata nodejs
RUN gem install rails -v '5.2.1'

WORKDIR /files_api
ADD Gemfile Gemfile.lock /files_api/
RUN bundle install