require 'sequel'

Sequel.migration do
  change do
    create_table(:events) do
      primary_key :id
      foreign_key :member_id

      String :type
      String :header
      String :context

    end
  end
end

