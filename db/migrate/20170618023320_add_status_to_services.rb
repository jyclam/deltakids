class AddStatusToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :status, :boolean, default: false
  end
end
