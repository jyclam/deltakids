class AddExtraInformationToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :age_group, :string
    add_column :organizations, :activity_type, :string
    add_column :organizations, :description, :string
    add_column :organizations, :target_clientelle, :string
    add_column :organizations, :services, :string
  end
end
