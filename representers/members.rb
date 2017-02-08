# frozen_string_literal: true
require_relative 'member'

# Represents overall page information for JSON API output
class MembersRepresenter < Roar::Decorator
  include Roar::JSON

  collection :members, extend: MemberRepresenter, class: Member
end
