# This is a sample business object.
# It's a basic Ruby object with properties.
# You can mix-in other modules and gems if you like. (Go wild!)
module Skeleton
  module Platform
    class Artist
      attr_accessor \
        :id,
        :name,
        :album_ids

      def initialize(id: nil, name:, album_ids:)
        @id = id
        @name = name
        @album_ids = album_ids
      end
    end

    class NullArtist < Artist
      def initialize
      end

      def id
        nil
      end

      def name
        nil
      end

      def album_ids
        []
      end
    end
  end
end
