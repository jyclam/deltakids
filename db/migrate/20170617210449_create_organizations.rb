class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :phone_num
      t.string :website
      t.string :unit_num
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :organizations, :email, unique: true
    add_index :organizations, :title, unique: true
  end
end
