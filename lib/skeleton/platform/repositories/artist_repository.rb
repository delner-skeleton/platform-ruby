require 'skeleton/platform/artist'

# This is a sample repository interface.
# It's a basic Ruby module that defines functions of the repository.
# You should implement and override its behavior in a repository class.
module Skeleton
  module Platform
    module Repositories
      module ArtistRepository
        # Strict artist search.
        # id:       ID of the artist
        # Returns:  Album object.
        #           Raises NotFoundError if no result.
        def find(id)
          raise NotImplementedError.new
        end

        # Soft artist search.
        # id:       ID of the artist
        # Returns:  Album object.
        #           Returns NullArtist if no result.
        def by_id(id)
          raise NotImplementedError.new
        end

        # Artist by album search.
        # id:       Album ID associated with the artist
        # Returns:  Array of Artist object.
        #           Returns [] if no result.
        def by_album_id(artist_id)
          raise NotImplementedError.new
        end

        # Case insensitive artist name search.
        # id:       Partial name of the artist.
        # Returns:  Array of Artist object.
        #           Returns [] if no result.
        def like_name(name)
          raise NotImplementedError.new
        end

        class NotFoundError < StandardError
          attr_reader :id

          def initialize(id)
            @id = id
          end

          def message
            "No artist found for ID '#{id}'!"
          end
        end
      end

      class NullArtistRepository
        include ArtistRepository

        def find(id)
          raise ArtistRepository::NotFoundError.new(id)
        end

        def by_id(id)
          NullArtist.new
        end

        def by_album_id(album_id)
          []
        end

        def like_name(name)
          []
        end
      end
    end
  end
end
