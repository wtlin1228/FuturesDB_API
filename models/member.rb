# frozen_string_literal: true

# Represents a Member's stored information
class Member < Sequel::Model
  one_to_many :events
end