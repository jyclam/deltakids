class AddRegistrationDescriptionAndMoreInfoToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :registration, :boolean
    add_column :activities, :description, :text
    add_column :activities, :more_info, :string
  end
end
