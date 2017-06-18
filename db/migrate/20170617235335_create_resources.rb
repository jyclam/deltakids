class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.boolean :feature
      t.date :start_date
      t.date :end_date
      t.string :location
      t.text :description
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end
  end
end
