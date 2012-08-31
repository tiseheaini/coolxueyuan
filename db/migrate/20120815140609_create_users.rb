class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :nickname
      t.string :password_hash, :null => false
      t.string :password_salt, :null => false
			t.string :state
			t.string :city
			t.string :photo
      t.boolean :gender
      t.string :qq
			t.integer :node_id,       :null => false
      t.string :schooldate
			t.boolean :monitor,       :default => 0
			t.boolean :admin,         :default => 0

      t.timestamps
    end
  end
end
