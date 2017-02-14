# frozen_string_literal: true

# Delete a new member
class MemberDelete
  extend Dry::Monads::Either::Mixin
  extend Dry::Container::Mixin

  def self.call(params)
    Dry.Transaction(container: self) do
      step :validate_request_json
      step :check_if_already_exist
      step :delete_the_member
    end.call(params)
  end

  register :validate_request_json, lambda { |request_body|
  	begin
      member_representation = MemberRepresenter.new(People.new)
  	  Right(member_representation.from_json(request_body))
  	rescue
  	  Left(Error.new(:bad_request, 'Input invalid, fail to delete member'))
  	end
  }

  register :check_if_already_exist, lambda { |data|
    if nil == Member.find(phone: data[:phone])
      Left(Error.new(:bad_request, 'This member dose not exits'))
    else
      Right(data)
    end
  }

  register :delete_the_member, lambda { |data|
    member = Member.find(phone=data[:phone])
    member.delete
    Right('Delete this member successful')
  }
end
