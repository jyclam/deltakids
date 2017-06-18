class AddRegistrationBooleanToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :registration, :boolean
  end
end
