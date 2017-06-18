class CreateResourceTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_topics do |t|
      t.string :name

      t.timestamps
    end
  end
end
