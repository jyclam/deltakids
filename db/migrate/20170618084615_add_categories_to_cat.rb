class AddCategoriesToCat < ActiveRecord::Migration[5.1]
  def change
    add_reference :cats, :category, foreign_key: true
  end
end
