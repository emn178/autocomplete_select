$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "autocomplete_select/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "autocomplete_select"
  s.version     = AutocompleteSelect::VERSION
  s.authors     = ["Chen, Yi-Cyuan"]
  s.email       = ["emn178@gmail.com"]
  s.homepage    = "https://github.com/emn178/autocomplete_select"
  s.summary     = "Integrate with JavaScript autocomplete library to provide select by autocomplete input and form helper."
  s.description = "Integrate with JavaScript autocomplete library to provide select by autocomplete input and form helper."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
end
