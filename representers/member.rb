# frozen_string_literal: true

# Represents the house data
class MemberRepresenter < Roar::Decorator
  include Roar::JSON

  property :name
  property :phone
  property :email
  property :location
  property :work
  property :money
  property :level
  property :time_join
  property :time_operate
end
