#!/usr/bin/env bash
# exit on error
set -e

bundle exec rails db:migrate
bundle exec rails db:seed

# Ruby on Rails
bundle exec rails server -b 0.0.0.0 -p "${PORT:-3000}"
