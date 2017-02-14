# frozen_string_literal: true

# Create a new member
class MemberUpdate
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin

  def self.call(params)
    Dry.Transaction(container: self) do
      step :validate_request_json
      step :check_if_exist
      step :update_the_member
    end.call(params)
  end

  register :validate_request_json, lambda { |request_body|
    begin
      member_representation = MemberRepresenter.new(People.new)
      Right(member_representation.from_json(request_body))
    rescue
      Left(Error.new(:bad_request, 'Input invalid, fail to update member'))
    end
  }

  register :check_if_exist, lambda { |data|
    if nil == Member.find(phone: data[:phone])
      Left(Error.new(:bad_request, 'This member does not exits'))
    else
      Right(data)
    end
  }

  register :update_the_member, lambda { |data|
    begin
      member = Member.find(phone: data[:phone],
                           email: data[:email])
      member.name = data[:name]
      member.phone = data[:phone]
      member.email = data[:email]
      member.location = data[:location]
      member.work = data[:work]
      member.money = data[:money]
      member.current_level = data[:current_level]
      member.expect_level = data[:expect_level]
      member.time_join = data[:time_join]
      member.time_operate = data[:time_operate]
      member.save

      Right(member)
    rescue
      Left(Error.new(:bad_request, 'Cannot update the member in DB'))
    end

  }
  
end
