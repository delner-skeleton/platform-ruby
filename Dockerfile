FROM ruby:2.4.1
LABEL author="Team"
LABEL author_email="team@skeleton.com"

# Setup a working directory
WORKDIR /opt/platform-ruby

# Copy gem specifications
RUN gem install bundler -v '1.15.4'
COPY Gemfile* ./
COPY skeleton-platform.gemspec .
COPY lib/skeleton/platform/version.rb lib/skeleton/platform/

# Install gems
RUN bundle install --system

# Add source code
COPY . /opt/platform-ruby
