source 'https://rubygems.org'

gem 'rails',         '4.2.5.1'
gem 'pg'                                       # Use postgresql as the database for Active Record

gem 'sass-rails',    '~> 5.0'                   # Use SCSS for stylesheets
gem 'uglifier',      '>= 1.3.0'                 # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails',  '~> 4.1.0'                 # Use CoffeeScript for .coffee assets and views


gem 'jquery-rails'                             # Use jquery as the JavaScript library

gem 'turbolinks'                               # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder',      '~> 2.0'                   # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# gem 'bcrypt', '~> 3.1.7'                     # Use ActiveModel has_secure_password (can probably go away once we move to Devise)

# Use Unicorn as the app server
# gem 'unicorn'


group :doc do
  gem 'sdoc',        '~> 0.4.0'                 # bundle exec rake doc:rails generates the API under doc/api.
end

group :development, :test do
  gem 'byebug'                                 # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end

group :development do
  gem 'web-console', '~> 2.0'                  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'                                 # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

group :test do
  gem "codeclimate-test-reporter", require: nil # So CircleCI can pass coverage details to CodeClimate
  gem 'rspec_junit_formatter', '0.2.2'          # for CircleCI - it'll have a better time identifying slow tests and from that, balance paralellism better...and it better reports errors in builds
end

