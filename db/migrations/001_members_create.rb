require 'sequel'

Sequel.migration do
  change do
    create_table(:members) do
      primary_key :id
      
      String :name
      String :phone
      String :email
      String :location
      String :work
      String :money
      String :current_level
      String :expect_level
      String :time_join
      String :time_operate
      
    end
  end
end

