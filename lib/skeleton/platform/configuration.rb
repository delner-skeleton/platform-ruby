require 'skeleton/platform/configuration/settings'

module Skeleton
  module Platform
    module Configuration
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def configure(&block)
          @settings = settings.tap { |s| yield(s) }
        end

        def settings
          @settings ||= Configuration::Settings.new
        end

        def settings=(settings)
          @settings = settings
        end

        def repositories
          settings.repositories
        end
      end
    end
  end
end
