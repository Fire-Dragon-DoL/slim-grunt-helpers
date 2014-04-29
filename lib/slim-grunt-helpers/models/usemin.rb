require 'pathname'

module SlimGruntHelpers

  module Models

    class Usemin

      BASE_OPTIONS = {}.freeze

      def initialize
        @links = []
      end

      def <<(path, options={})
        @links << { path: path.to_s, options: base_options.merge(options) }
      end
      alias_method :add,     :<<
      alias_method :include, :<<

      def require(path, options={})
        self.include(path, options) unless file_already_included? path
      end

      def each(options={})
        @links.each { |link| yield(transform_link(link, options)) }
      end

      def base_options
        BASE_OPTIONS
      end

      def require_tree(root_path, pattern, options={})
        unless root_path.respond_to? :join
          root_path = Pathname.new(root_path.to_s)
        end
        
        Dir[root_path.join(pattern).to_s].reject do |file|
          File.directory? file
        end.each do |file|
          file_name      = file.to_s
          real_root_path = "#{ root_path }/"
          file_name[real_root_path] = ''
          transform_ext             = options.delete(:transform_ext)
          unless transform_ext.nil?
            transform_ext = ".#{ transform_ext }" unless transform_ext[0] == '.'

            origin_ext = File.extname(file_name)
            file_name[origin_ext] = transform_ext
          end
          
          self.require file_name, options
        end
      end

      protected

        def transform_link(link, options={})
          raise NotImplementedError, 'This method must be implemented in child classes'
        end

      private

        def file_already_included?(path)
          path = path.to_s
          @links.find { |link| link[:path] == path }
        end

    end

  end

end