require 'action_view'

module ActionView
  module Helpers
    class FormBuilder
      def autocomplete_select(method, options = {}, html_options = {})
        text_field_tag(method, @template.autocomplete_select_options(options, html_options))
      end
    end
  end
end
