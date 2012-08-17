require './application.rb'
require 'sprockets'

map '/assets' do
	environment = Sprockets::Environment.new
	environment.append_path './assets/javascripts'
	environment.append_path './assets/stylesheets'
	environment.append_path './assets/images'
	run environment
end

map '/' do
	run Zombie::App
end