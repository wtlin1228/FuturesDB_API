# frozen_string_literal: true
require_relative 'spec_helper'

describe 'clean up the database' do
  describe 'Clear all tables' do
  	before do
      DB[:members].delete
      DB[:events].delete
    end

    it 'HAPPY: database should be empty' do
      Member.count.must_equal 0
      Event.count.must_equal 0
    end
  end

end



    