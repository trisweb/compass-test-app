require 'bundler'
Bundler.setup :default, (ENV['RACK_ENV'] || 'development')
 
require 'sprockets'
require 'compass'
require 'sprockets-sass'
require 'bootstrap-sass'
require 'handlebars_assets'
require 'coffee-script'
 
map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
 
  # Adds Twitter Bootstrap Javascripts
  environment.append_path Compass::Frameworks['bootstrap'].templates_directory + '/../vendor/assets/javascripts'
  run environment
end

run lambda{|env| [200, {}, ['Put your app here.']]}