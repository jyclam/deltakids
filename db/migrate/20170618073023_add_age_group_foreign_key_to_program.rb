class AddAgeGroupForeignKeyToProgram < ActiveRecord::Migration[5.1]
  def change
    add_reference :programs, :age_group, foreign_key: true
  end
end
