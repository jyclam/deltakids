class AddIsAdminToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :is_admin, :boolean, default: false
  end
end
