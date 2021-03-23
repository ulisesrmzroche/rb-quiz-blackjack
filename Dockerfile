FROM ruby:3.0
RUN mkdir /usr/src/app
ADD . /usr/src/app/
WORKDIR /usr/src/app/

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
RUN bundle install
COPY . /myapp