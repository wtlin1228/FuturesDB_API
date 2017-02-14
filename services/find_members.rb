# frozen_string_literal: true

# Loads data from futures database
class FindMembers
  extend Dry::Monads::Either::Mixin

  def self.call
    if (members = Member.all).nil?
      Left(Error.new(:not_found, 'No members found'))
    else
      Right(Members.new(members))
    end
  end
end
