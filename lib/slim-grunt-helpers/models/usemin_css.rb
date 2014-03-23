require 'slim-grunt-helpers/models/usemin'

module SlimGruntHelpers

  module Models

    class UseminCss < Usemin

      BASE_OPTIONS = { rel: 'stylesheet' }.freeze

      protected

        def transform_link(link)
          text  = %Q{<link href="#{ link[:path] }"}
          link[:options].each do |key, value|
            text << %Q{ #{ key }="#{ value }"}
          end
          text << ' />'

          text
        end

    end

  end

end