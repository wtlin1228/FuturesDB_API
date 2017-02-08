# frozen_string_literal: true
require_relative 'spec_helper'

describe 'Test create member' do
  it 'HAPPY: should create a new member' do
    post "/api/v0.1/member/create",
    {
      "name": "林暐唐",
      "phone": "0975833215",
      "email": "wtlin1228@gmail.com",
      "location": "新竹",
      "work": "學生",
      "money": "0",
      "level": "基本",
      "time_join": "20170101",
      "time_operate": "20170101" 
    }.to_json,
    'CONTENT_TYPE' => 'application/json'

    Member.count.must_be :>=, 1
  end
end
