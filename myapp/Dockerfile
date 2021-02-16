FROM ruby:2.3-alpine

ENV APP_ROOT /workspace
# postgresql-dev mysql-dev
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev nodejs" \
    RUBY_PACKAGES="ruby-json yaml"

RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    mkdir -p $APP_ROOT

WORKDIR $APP_ROOT
COPY . $APP_ROOT
RUN gem install bundler
RUN bundle install

EXPOSE 3000
RUN echo "Executando servidor em http://localhost:3000"
CMD ["rails", "server", "-b", "0.0.0.0"]