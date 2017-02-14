# frozen_string_literal: true
require_relative 'spec_helper'

describe 'Test delete member' do
  it 'HAPPY: should delete a member' do
    # test delete member
    post "/api/v0.1/member/delete",
    {
      "name": "林暐唐",
      "phone": "0975833215",
      "email": "wtlin1228@gmail.com",
      "location": "新竹",
      "work": "學生",
      "money": "0",
      "current_level": "0",
      "expect_level": "10",
      "time_join": "20170101",
      "time_operate": "20170101" 
    }.to_json,
    'CONTENT_TYPE' => 'application/json'

    Member.count.must_equal 0

  end
end
