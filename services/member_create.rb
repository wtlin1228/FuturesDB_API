# frozen_string_literal: true

# Create a new member
class MemberCreate
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin

  def self.call(params)
    Dry.Transaction(container: self) do
      step :validate_request_json
      step :check_if_already_exist
      step :create_new_member
    end.call(params)
  end

  register :validate_request_json, lambda { |request_body|
  	begin
  	  member_representation = MemberRepresenter.new(People.new)
  	  Right(member_representation.from_json(request_body))
  	rescue
  	  Left(Error.new(:bad_request, 'Input invalid, fail to create member'))
  	end
  }

  register :check_if_already_exist, lambda { |data|
    if nil == Member.find(phone: data[:phone])
      Right(data)
    else
      Left(Error.new(:bad_request, 'This member already exits'))
    end
  }

  register :create_new_member, lambda { |data|
    member = Member.create(
               name: data[:name],
               phone: data[:phone],
               email: data[:email],
               location: data[:location],
               work: data[:work],
               money: data[:money],
               current_level: data[:current_level],
               expect_level: data[:expect_level],
               time_join: data[:time_join],
               time_operate: data[:time_operate]   
            )
    Right(member)
  }
end
