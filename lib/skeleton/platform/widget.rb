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
