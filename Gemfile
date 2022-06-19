# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 7.0.3'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'bcrypt', '~> 3.1.7'

gem 'active_model_serializers'

gem 'jwt'

gem 'cancancan'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'rack-cors'

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

group :development do
  gem 'brakeman'
end
