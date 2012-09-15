class AddReadToForgetpassword < ActiveRecord::Migration
  def change
    add_column :forgetpasswords, :read, :boolean, :default => true
  end
end
