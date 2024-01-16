#!/usr/bin/env bash

#exit on server
set -o errexit

bundle install
bundle exec rails assets:precomplie
bundle exec rails assets:clean
bundle exec rails db:migrate