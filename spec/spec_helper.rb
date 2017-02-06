# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'

require 'rack/test'
require './init.rb'

def app
  FuturesDB
end
