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

rspec:
	docker-compose run --rm platform-ruby bundle exec rspec
