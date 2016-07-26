# autocomplete_select

[![Build Status](https://api.travis-ci.org/emn178/autocomplete_select.png)](https://travis-ci.org/emn178/autocomplete_select)
[![Coverage Status](https://coveralls.io/repos/emn178/autocomplete_select/badge.svg?branch=master)](https://coveralls.io/r/emn178/autocomplete_select?branch=master)

Integrate with jQuery UI autocomplete library to provide select by autocomplete input and form helper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'autocomplete_select'
```

And then execute:

    bundle

Or install it yourself as:

    gem install autocomplete_select

## Usage

### Require Javascript
Make sure you required **jQuery**, **jQuery UI** and add the following to /app/assets/javascripts/application.js:
```JavaScript
//= require autocomplete_select
```
### Require CSS
Make sure you required **jQuery UI** css.

### Controller
You have to implement a controller and action like this
```ruby
class UsersController < ActionController::Base
  def search
    term = params[:term]
    users = User.where("name LIKE ?", "%#{term}%")
    render :json => users.map{ |user| {:value => user.id, :label => user.name}}
  end
end
```
The input `term` is what you type in textbox.
The output must be an array with `value` and `label`.

### Helpers
You can use `autocomplete_select_tag` and `autocomplete_select`.
```ERB
<%= autocomplete_select_tag(name, search_path, value, autocomplete_options, html_options) %>
<%= autocomplete_select_tag(name, search_path, value, display, autocomplete_options, html_options) %>
<%= autocomplete_select_tag(:user_id, search_users_path, 1, 'username', {:minLength => 3}, {:class => 'user'}) %>
<%= autocomplete_select_tag(:user_id, search_users_path, 1, 'username') %>
<%= autocomplete_select_tag(:user_id, search_users_path) %>

or form builder

<% form_for @item do |f| %>
<%= f.autocomplete_select(method, search_path, autocomplete_options, html_options) %>
<%= f.autocomplete_select(method, search_path, display, autocomplete_options, html_options) %>
<%= f.autocomplete_select(:user_id, search_users_path, 'username', {:minLength => 3}, {:class => 'user'}) %>
<%= f.autocomplete_select(:user_id, search_users_path, 'username') %>
<%= f.autocomplete_select(:user_id, search_users_path) %>
<% end %>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/autocomplete_select  
Author: Chen, Yi-Cyuan (emn178@gmail.com)
