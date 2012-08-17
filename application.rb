require 'rubygems'
require 'sinatra/base'

module Zombie
  class App < Sinatra::Base
    get '/' do
      File.read('public/index.html')
    end
  end
end
