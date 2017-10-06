# This is a sample business object.
# It's a basic Ruby object with properties.
# You can mix-in other modules and gems if you like. (Go wild!)
module Skeleton
  module Platform
    class Widget
      attr_accessor :color

      def initialize(color: 'blue')
        @color = color
      end
    end
  end
end
