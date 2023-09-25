FROM ruby:3.2

RUN export RUBY_GC_STATS=1

RUN apt-get update && apt-get install -y \
  build-essential \
  libpng-dev libzip-dev \
  vim curl imagemagick

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Javascript setup
RUN cd /tmp && curl -fsSL https://bun.sh/install | BUN_INSTALL=/usr bash
RUN export BUN_INSTALL="/home/avamia/.bun"
RUN export PATH="$BUN_INSTALL/bin:$PATH"
RUN . ~/.bashrc

WORKDIR /avamia

ADD Gemfile Gemfile
RUN gem install bundler -v 2.4
RUN bundle install

# install packages
ADD package.json package.json
RUN bun install

# cleanup any temporary apt files.
RUN rm -rf /var/lib/apt/lists/*\
  && apt-get purge --auto-remove\
  && apt-get clean

RUN rm Gemfile && rm Gemfile.lock
RUN rm package.json

RUN gem env
RUN bun -v
