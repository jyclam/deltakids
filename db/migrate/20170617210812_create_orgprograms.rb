class CreateOrgprograms < ActiveRecord::Migration[5.1]
  def change
    create_table :orgprograms do |t|
      t.references :organization, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
