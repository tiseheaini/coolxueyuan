class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id, :null => false
      t.integer :topic_id, :null => false
      t.text :text

      t.timestamps
    end
  end
end
