module AutocompleteSelect
  module Helper
    def autocomplete_select_options(path, label_or_options = nil, args)
      if label_or_options.is_a?(Hash)
        options = label_or_options
      else
        label = label_or_options
        options = args.shift
      end
      html_options = args.shift || {}

      options ||= {}
      options[:source] = path
      options[:label] = label if label
      html_options.deep_merge({
        :data => {
          :"autocomplete-select" => options.to_json
        }
      })
    end

    def autocomplete_select_tag(name, path, value = nil, label_or_options = nil, *args)
      text_field_tag(name, value, autocomplete_select_options(path, label_or_options, args))
    end
  end
end
