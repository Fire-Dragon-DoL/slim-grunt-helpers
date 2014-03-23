module SlimGruntHelpers

  module Models

    class Usemin

      BASE_OPTIONS = {}.freeze

      def initialize
        @links = []
      end

      def <<(path, options={})
        @links << { path: path, options: base_options.merge(options) }
      end

      def each
        @links.each { |link| yield(transform_link(link)) }
      end

      def base_options
        BASE_OPTIONS
      end

      protected

        def transform_link(link)
          raise NotImplementedError, 'This method must be implemented in child classes'
        end

    end

  end

end