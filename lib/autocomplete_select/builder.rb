require 'action_view'

module ActionView
  module Helpers
    class FormBuilder
      def autocomplete_select(method, path, label_or_options = nil, *args)
        text_field(method, @template.autocomplete_select_options(path, label_or_options, args))
      end
    end
  end
end
