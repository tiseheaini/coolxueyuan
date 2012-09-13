class CreateForgetpasswords < ActiveRecord::Migration
  def change
    create_table :forgetpasswords do |t|
      t.string :user_name,            :null => false
      t.string :user_qq,              :null => false
      t.string :password_forget_hash, :null => false

      t.timestamps
    end
  end
end
