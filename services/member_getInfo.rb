# frozen_string_literal: true

# Get member's information from database
class MemberInfo
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin

  def self.call(params)
    Dry.Transaction(container: self) do
      step :get_members_from_db
      step :format_the_data
    end.call(params)
  end

  register :get_members_from_db, lambda { |request_body|
  	begin
  	  member = Member.find(
                 phone: request_body['phone'],
                 email: request_body['email']
               )

      Right(member)
  	rescue
  	  Left(Error.new(
             :bad_request, 
             'Cannot get the member information form database'
           )
      )
  	end
  }

  register :format_the_data, lambda { |data|
    
    result = {
      name: data.name,
      phone: data.phone,
      email: data.email,
      location: data.location,
      work: data.work,
      money: data.money,
      current_level: data.current_level,
      expect_level: data.expect_level,
      time_join: data.time_join,
      time_operate: data.time_operate 
    }.to_json

    Right(result)
  }

end
