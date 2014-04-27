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
        self.include(path, options) unless @links.include? path.to_s
      end

      def each
        @links.each { |link| yield(transform_link(link)) }
      end

      def base_options
        BASE_OPTIONS
      end

      def require_tree(root_path, pattern, relative=false, options={})
        unless root_path.respond_to? :join
          root_path = Pathname.new(root_path.to_s)
        end
        
        Dir[root_path.join(pattern).to_s].reject do |file|
          File.directory? file
        end.each do |file|
          file_name       = file.to_s
          real_root_path  = root_path.to_s
          real_root_path += '/' if relative
          file_name[real_root_path] = ''
          
          self.require file_name, options
        end
      end

      protected

        def transform_link(link)
          raise NotImplementedError, 'This method must be implemented in child classes'
        end

    end

  end

end