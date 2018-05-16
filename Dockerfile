FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /maln-acebook
WORKDIR /maln-acebook
COPY Gemfile /maln-acebook/Gemfile
COPY Gemfile.lock /maln-acebook/Gemfile.lock
RUN bundle install
COPY . /maln-acebook
