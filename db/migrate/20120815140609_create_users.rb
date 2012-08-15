class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :nickname
      t.string :password_hash, :null => false
      t.string :passwork_salt, :null => false
      t.boolean :gender
      t.string :qq
      t.string :schooldate

      t.timestamps
    end
  end
end
