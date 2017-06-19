class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.text :events, array: true, default: []

      t.timestamps
    end
  end
end
