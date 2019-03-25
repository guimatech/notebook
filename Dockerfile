FROM ruby:2.6.2
LABEL maintainer="Lucas Guimarães"

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3 libsqlite3-dev nodejs
RUN mkdir /app

WORKDIR /app
COPY . /app

RUN bundle install
EXPOSE 3000
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]