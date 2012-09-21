class AddRepliesCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :replies_count, :integer, :default => 0
  end
end
