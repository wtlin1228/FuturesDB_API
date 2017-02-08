require 'sinatra'
require 'econfig'

#configure based on environment

class FuturesDB < Sinatra::Base
  extend Econfig::Shortcut
  
  API_VER = 'api/v0.1'

  configure do
    Econfig.env = settings.environment.to_s
    Econfig.root = File.expand_path('..', settings.root)
  end

  get '/?' do
    "FuturesDB latest version endpoints are at: /#{API_VER}/"
  end
end
