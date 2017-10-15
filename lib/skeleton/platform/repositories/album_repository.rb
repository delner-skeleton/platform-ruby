require 'skeleton/platform/album'

# This is a sample repository interface.
# It's a basic Ruby module that defines functions of the repository.
# You should implement and override its behavior in a repository class.
module Skeleton
  module Platform
    module Repositories
      module AlbumRepository
        # Strict album search.
        # id:       ID of the album
        # Returns:  Album object.
        #           Raises NotFoundError if no result.
        def find(id)
          raise NotImplementedError.new
        end

        # Soft album search.
        # id:       ID of the album
        # Returns:  Album object.
        #           Returns NullAlbum if no result.
        def by_id(id)
          raise NotImplementedError.new
        end

        # Album by artist search.
        # id:       Artist ID of the album
        # Returns:  Array of Album object.
        #           Returns [] if no result.
        def by_artist_id(artist_id)
          raise NotImplementedError.new
        end

        # Case insensitive album title search.
        # id:       Partial title of the album.
        # Returns:  Array of Album object.
        #           Returns [] if no result.
        def like_title(title)
          raise NotImplementedError.new
        end

        class NotFoundError < StandardError
          attr_reader :id

          def initialize(id)
            @id = id
          end

          def message
            "No album found for ID '#{id}'!"
          end
        end
      end

      class NullAlbumRepository
        include AlbumRepository

        def find(id)
          raise AlbumRepository::NotFoundError.new(id)
        end

        def by_id(id)
          NullAlbum.new
        end

        def by_artist_id(artist_id)
          []
        end

        def like_title(title)
          []
        end
      end
    end
  end
end
