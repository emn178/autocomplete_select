module AutocompleteSelect
  module Helper
    def autocomplete_select_options(options, html_options)
      html_options.deep_merge({
        :data => {
          :"autocomplete-select" => options.to_json
        }
      })
    end

    def autocomplete_select_tag(name, model_or_path, *args)
      if model_or_path < ActiveRecord::Base
        model = model_or_path
        search = args.shift
        id = [model.model_name, search].join('_')
        path = AutocompleteSelect::Engine.routes.url_helpers.autocomplete_path(:id => id)
      else
        path = model_or_path
      end
      value = args.shift
      options = args.shift || {}
      options[:source] = path
      html_options = args.shift || {}
      text_field_tag(name, value, autocomplete_select_options(options, html_options))
    end
  end
end
