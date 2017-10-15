require 'skeleton/platform/version'

require 'skeleton/platform/configuration'
require 'skeleton/platform/configuration/repositories'
require 'skeleton/platform/configuration/settings'

# Business objects
require 'skeleton/platform/album'
require 'skeleton/platform/artist'

# Repositories
require 'skeleton/platform/repositories/album_repository'
require 'skeleton/platform/repositories/artist_repository'

module Skeleton
  module Platform
    include Configuration
  end
end
