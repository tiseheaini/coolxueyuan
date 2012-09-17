class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
			t.integer :senduser,           :null => false
			t.integer :receiveuser,        :null => false
			t.text :text
			t.boolean :senduser_delete,    :default => false
			t.boolean :receiveuser_delete, :default => false
			t.boolean :read,               :default => false

      t.timestamps
    end
  end
end
