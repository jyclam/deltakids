class CreateResourceFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_filters do |t|
      t.references :resource, foreign_key: true, index: true
      t.references :age_group, foreign_key: true, index: true
      t.references :resource_topic, foreign_key: true, index: true
      t.references :resource_location, foreign_key: true, index: true
      t.references :resource_type, foreign_key: true, index: true

      t.timestamps
    end
  end
end
