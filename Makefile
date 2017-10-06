.PHONY: build-gem build-image bash rspec

# Gem
# ---

build-gem:
	gem build skeleton-platform.gemspec

# Docker
# ------

build-image:
	docker-compose build

bash:
	docker-compose run --rm platform-ruby /bin/bash

console:
	docker-compose run --rm platform-ruby ./bin/console

rspec:
	docker-compose run --rm platform-ruby bundle exec rspec

rubocop:
	docker-compose run --rm platform-ruby bundle exec rubocop
