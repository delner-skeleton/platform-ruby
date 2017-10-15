# This is a configuration settings object.
# It's a Ruby class that holds runtime configuration for the library.
module Skeleton
  module Platform
    module Configuration
      class Repositories
        def albums
          @albums ||= ::Skeleton::Platform::Repositories::NullAlbumRepository.new
        end

        def albums=(repository)
          @albums = repository
        end

        def artists
          @artists ||= ::Skeleton::Platform::Repositories::NullArtistRepository.new
        end

        def artists=(repository)
          @artists = repository
        end
      end
    end
  end
end
