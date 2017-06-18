class AddWebsiteToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :website, :string
  end
end
