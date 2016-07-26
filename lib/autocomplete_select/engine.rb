module AutocompleteSelect
  class Engine < ::Rails::Engine
    # isolate_namespace AutocompleteSelect
    initializer "autocomplete_select" do
      ActiveSupport.on_load(:action_view) do
        include AutocompleteSelect::Helper
      end
    end
  end
end
