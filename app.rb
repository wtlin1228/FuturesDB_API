# frozen_string_literal: true
require 'sinatra'
require 'econfig'

# GroupAPI web service
class FuturesDB < Sinatra::Base
  extend Econfig::Shortcut

  Econfig.env = settings.environment.to_s
  Econfig.root = settings.root
  
  API_VER = 'api/v0.1'

  get '/?' do
    "FuturesDB latest version endpoints are at: /#{API_VER}/"
  end
end
