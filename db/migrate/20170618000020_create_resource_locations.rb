class CreateResourceLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_locations do |t|
      t.string :location

      t.timestamps
    end
  end
end
