class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :category
      t.string :description

      t.timestamps
    end
    add_index :programs, :category, unique: true
  end
end
