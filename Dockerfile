FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /postit
WORKDIR /postit
ADD Gemfile /postit/Gemfile
ADD Gemfile.lock /postit/Gemfile.lock
RUN bundle install
ADD . /postit
RUN chmod 766 /postit/lint