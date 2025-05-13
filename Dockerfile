FROM ruby:3.4.3-slim
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    telnet \
    nodejs \
    libyaml-dev \
    vim \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update -qq && apt-get install -y default-libmysqlclient-dev

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT
RUN bundle install

EXPOSE  3000
CMD rm -f tmp/pids/server.pid && bin/rails server -p 3000 -b '0.0.0.0'
