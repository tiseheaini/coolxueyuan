class AddReadToMails < ActiveRecord::Migration
  def change
    add_column :mails, :read, :boolean, :default => false
  end
end
