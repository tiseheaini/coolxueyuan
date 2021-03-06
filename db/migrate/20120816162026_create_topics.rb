class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id, :null => false
      t.integer :node_id, :null => false
      t.string :title
      t.text :text

      t.timestamps
    end

		add_index :topics, :user_id
		add_index :topics, :node_id
  end
end
