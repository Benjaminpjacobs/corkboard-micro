source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'mongoid'
gem 'faker'
gem 'kaminari'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'figaro'
gem 'jwt'

# gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-rails'
  gem 'database_cleaner'
end
