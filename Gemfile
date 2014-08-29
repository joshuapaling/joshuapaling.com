ruby '2.1.2'
source 'https://rubygems.org'

gem 'rails', '~> 4.1.0'

gem 'pg'

gem 'sass-rails',   '~> 4.0.2'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'compass-rails'
gem 'jquery-rails'

gem 'rails_12factor', group: :production

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara'
end

group :development do
  gem "capistrano", "~> 2.15.5"

  gem 'better_errors'
  gem 'rails-footnotes', :github => 'josevalim/rails-footnotes'
  # Use my own version for now...
  # gem 'rails-footnotes', :path => '../../rails-footnotes'
  gem "schema_to_scaffold", "~> 0.5.0"
  gem "rails-admin-scaffold", "~> 0.0.5"
  gem 'pry'
  gem 'xray-rails'

  gem 'awesome_print'

  gem 'spring'
end

gem 'redcarpet'
gem 'rouge'

gem 'kaminari'

gem 'therubyracer' # based on http://stackoverflow.com/questions/9057475/rake-dbcreate-could-not-find-a-javascript-runtime

gem 'rmagick'
gem 'carrierwave'

gem 'backbone-on-rails'

gem 'devise', '3.2.4'
gem 'simple_form', github: 'plataformatec/simple_form' # http://stackoverflow.com/questions/23207939/cant-update-to-rails-4-1-conflict-with-simple-form


# FOR ADMIN AREA
gem 'epic-editor-rails'
gem 'bootstrap-sass', '~> 3.1.1'

gem 'protected_attributes' # had to add this to upgrade to rails 4.1 - should be able to change code to use strong params then remove this gem.
gem 'rvm-capistrano' # I think this handles rvm on the server side, on deployment.