class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.integer :senduser,           :null => false
      t.integer :receiveuser,        :null => false
      t.text :text
      t.boolean :senduser_delete,    :default => false
      t.boolean :receiveuser_delete, :default => false

      t.timestamps
    end
  end
end
