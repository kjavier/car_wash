source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'

# Database 
gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Assets and template related gems
gem 'jquery-rails'
gem 'turbolinks'
gem 'slim'
gem 'es5-shim-rails'
gem 'therubyracer', '~> 0.12.3'
gem 'sass-rails'
gem 'uglifier'

# Pagination
gem 'kaminari', branch: 'master'

group :development do
  gem 'awesome_print'
  gem 'hirb'
  gem 'better_errors'
  gem 'meta_request'
  gem 'rainbow'

  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-rescue'
  gem 'pry-byebug'

  gem 'brakeman'
  gem 'reek'
  gem 'rubocop'
  gem 'ruby-prof'
  gem 'oink'
  gem 'rack-mini-profiler'
  gem 'flamegraph'
  gem 'stackprof'
  gem 'memory_profiler'
  gem 'bundler-audit'
  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'priscilla'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 3.0'
  gem 'shoulda-kept-respond-with-content-type'
  gem 'rails-controller-testing'
  gem 'fabrication'
  gem 'faker'
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
