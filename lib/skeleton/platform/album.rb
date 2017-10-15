# This is a sample business object.
# It's a basic Ruby object with properties.
# You can mix-in other modules and gems if you like. (Go wild!)
module Skeleton
  module Platform
    class Album
      attr_accessor \
        :id,
        :title,
        :artist_ids,
        :release_date

      def initialize(id: nil, title: nil, artist_ids: [], release_date: nil)
        @id = id
        @title = title
        @artist_ids = artist_ids
        @release_date = release_date
      end

      def by_one_artist?
        artist_ids.length == 1
      end
    end

    class NullAlbum < Album
      def initialize
      end

      def id
        nil
      end

      def title
        nil
      end

      def artist_ids
        []
      end

      def release_date
        nil
      end
    end
  end
end
