#!/usr/bin/env bash

#exit on server
set -o errexit

bundle install
./bin/rails assets:precomplie
./bin/rails assets:clean
./bin/rails db:migrate