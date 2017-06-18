class AddPaidBooleanToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :paid, :boolean
  end
end
