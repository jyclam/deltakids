class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :logo
      t.references :category, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
