class AddIsApprovedColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_approved, :boolean, index: true
  end
end
