class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :unit_num
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone_num
      t.string :time_start
      t.string :time_end
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
