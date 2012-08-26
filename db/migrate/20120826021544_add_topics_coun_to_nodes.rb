class AddTopicsCounToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :topics_count, :integer, :default => 0
  end
end
