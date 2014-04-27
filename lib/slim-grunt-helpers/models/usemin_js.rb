require 'slim-grunt-helpers/models/usemin'

module SlimGruntHelpers

  module Models

    class UseminJs < Usemin

      protected

        def transform_link(link, options={})
          link_path  = ''
          link_path += '/' if options[:absolute]
          link_path += link[:path].to_s
          
          text  = %Q{<script src="#{ link_path }"}
          link[:options].each do |key, value|
            if value == true
              text << %Q{ #{ key }}
            elsif value
              text << %Q{ #{ key }="#{ value }"}
            end
          end
          text << '></script>'

          text
        end

    end

  end

end