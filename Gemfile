source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.14'

gem 'sass-rails', '>=3.2' # sass-rails needs to be higher than 3.2
gem 'bootstrap-sass', '~> 2.3.2.1'
gem 'minitest-rails'
gem 'font-awesome-sass-rails'
gem 'flexslider'
gem "devise", "~> 3.1.1"
gem "simplecov", :require => false, :group => :test
gem "pundit"

group :test, :development do
  gem 'minitest-rails-capybara'
  gem 'minitest-colorize'
  gem 'minitest-focus'
  gem 'turn'
  gem 'sqlite3'
  gem 'launchy'
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'activerecord-postgresql-adapter'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
