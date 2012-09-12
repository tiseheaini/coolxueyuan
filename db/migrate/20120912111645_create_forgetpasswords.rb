class CreateForgetpasswords < ActiveRecord::Migration
  def change
    create_table :forgetpasswords do |t|
      t.string :user,                 :null => false
      t.string :password_forget_hash, :null => false

      t.timestamps
    end
  end
end
