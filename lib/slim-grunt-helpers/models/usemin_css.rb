require 'slim-grunt-helpers/models/usemin'

module SlimGruntHelpers

  module Models

    class UseminCss < Usemin

      BASE_OPTIONS = { rel: 'stylesheet' }.freeze

      def base_options
        BASE_OPTIONS
      end

      protected

        def transform_link(link, options={})
          link_path  = ''
          link_path += '/' if options[:absolute]
          link_path += link[:path].to_s

          text  = %Q{<link href="#{ link_path }"}
          link[:options].each do |key, value|
            if value == true
              text << %Q{ #{ key }}
            elsif !value.nil? && value != false
              text << %Q{ #{ key }="#{ value }"}
            end
          end
          text << ' />'

          text
        end

    end

  end

end