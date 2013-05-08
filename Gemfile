source 'https://rubygems.org'

gem 'rails'

gem 'activerecord-jdbcpostgresql-adapter', :platforms => [:jruby]
gem 'pg', :platforms => [:mri]

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier'
  gem 'therubyrhino'
end

gem 'jquery-rails'
gem "bootstrap-sass"
gem "devise"
gem "cancan"
gem "rolify"
gem "simple_form"

gem "figaro"

group :development do
  gem "quiet_assets"
  gem "better_errors"
  gem "binding_of_caller", :platforms => [:mri_19, :rbx]
end

group :test do
  gem "capybara"
  gem 'minitest-reporters'
  gem "factory_girl_rails"
  gem 'webmock', '1.9.3' #vcr 2.4.0 needs webmock < 1.10
  gem 'vcr'
  gem 'faker'
  gem 'shoulda-context'
end
