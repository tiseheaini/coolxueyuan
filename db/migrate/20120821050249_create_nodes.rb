class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name, :null => false
			t.integer :topics_count, :default => 0

      t.timestamps
    end
  end
end
