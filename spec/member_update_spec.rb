# frozen_string_literal: true
require_relative 'spec_helper'

describe 'Test create member' do
  it 'HAPPY: should create a new member' do
    # test create member
    post "/api/v0.1/member/update",
    {
      "name": "Leo",
      "phone": "0975833215",
      "email": "wtlin1228@gmail.com",
      "location": "Hsinchu",
      "work": "Student",
      "money": "0",
      "current_level": "1",
      "expect_level": "10",
      "time_join": "20170101",
      "time_operate": "20170101" 
    }.to_json,
    'CONTENT_TYPE' => 'application/json'

    Member.count.must_be :>=, 1

    # test get member's information
    get "/api/v0.1/member/0975833215/wtlin1228@gmail.com/?"

    last_response.status.must_equal 200
    last_response.content_type.must_equal 'application/json'
    member = JSON.parse(last_response.body)
    member['name'].must_equal "Leo"
    member['phone'].must_equal "0975833215"
    member['email'].must_equal "wtlin1228@gmail.com"
    member['location'].must_equal "Hsinchu"
    member['work'].must_equal "Student"
    member['money'].must_equal "0"
    member['current_level'].must_equal "1"
    member['expect_level'].must_equal "10"
    member['time_join'].must_equal "20170101"
    member['time_operate'].must_equal "20170101"
  end
end
