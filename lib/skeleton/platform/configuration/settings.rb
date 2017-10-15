require 'skeleton/platform/configuration/repositories'

# This is a configuration settings object.
# It's a Ruby class that holds runtime configuration for the library.
module Skeleton
  module Platform
    module Configuration
      class Settings
        def repositories
          @repositories ||= Repositories.new
        end

        def repositories=(repositories)
          @repositories = repositories
        end
      end
    end
  end
end
