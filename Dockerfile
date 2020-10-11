ARG RUBY_VERSION=2.7.2

FROM ruby:${RUBY_VERSION}-alpine AS build

WORKDIR /usr/src/app

RUN apk add --update --no-cache \
    build-base curl-dev git \
    postgresql-dev yaml-dev zlib-dev nodejs yarn \
    tzdata

COPY Gemfile Gemfile.lock package.json yarn.lock ./

RUN bundle config set deployment 'true' && \
    bundle config set without 'development:test' && \
    bundle install --jobs 4 --retry 3 && \
    bundle clean && \
    yarn install --production

COPY . .

ENV SECRET_KEY_BASE=disabled RAILS_ENV=production

RUN bundle exec rails assets:precompile && \
    rm -rf node_modules tmp/cache

FROM ruby:${RUBY_VERSION}-alpine

WORKDIR /usr/src/app

RUN apk add --update --no-cache postgresql-client tzdata && \
    bundle config set deployment 'true'

COPY --from=build /usr/src/app /usr/src/app

ENV PORT=80

EXPOSE 80

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]
