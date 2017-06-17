class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :date_start
      t.string :date_end
      t.boolean :repeat
      t.references :age_group, foreign_key: true
      t.references :program, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :unit_num
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone_num
      t.string :time_start
      t.string :time_end

      t.timestamps
    end
  end
end
