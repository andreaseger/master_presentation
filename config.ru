require 'bundler'
rack_env = ENV['RACK_ENV'] || 'development'

Bundler.setup
Bundler.require(:default, rack_env)

require './presentation'
map '/' do
  run Presentation.new
end