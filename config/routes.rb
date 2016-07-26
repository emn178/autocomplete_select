AutocompleteSelect::Engine.routes.draw do
  resources :autocompletes, :path => '/', :only => [:show]
end
