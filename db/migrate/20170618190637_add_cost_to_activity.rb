class AddCostToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :cost, :string
  end
end
