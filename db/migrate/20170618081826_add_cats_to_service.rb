class AddCatsToService < ActiveRecord::Migration[5.1]
  def change
    add_reference :services, :cat, foreign_key: true, index: true
  end
end
