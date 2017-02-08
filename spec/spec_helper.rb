# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/rg'
require 'rack/test'
require 'webmock'

require './init.rb'

include Rack::Test::Methods

def app
  FuturesDB
end
