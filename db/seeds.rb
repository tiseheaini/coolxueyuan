# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Node.delete_all
  
  Node.create(:name => "应用心理学")
  Node.create(:name => "临床医学")
  Node.create(:name => "麻醉学")
  Node.create(:name => "医学影像学")
  Node.create(:name => "中医学")
  Node.create(:name => "针灸推拿学")
  Node.create(:name => "西医临床医学")

  Topic.delete_all

  30.times do |t|
  Topic.create(:user_id => '1', :node_id => '2', :title => "主题#{t}", 
               :text => "#{t}.以前上学的时候就听的就不是很明白，许多书里也讲的似是而非，
                              在后来编程的时候又遇到很多名词像addListener，bind，槽，回调，事件，
                              消息等等似乎都跟“中断”这个词有关。所以也上网看过许多帖子的解释，
                              过程虽然很清晰明了，但是总觉得还是哪里隔着一层膜，让人那么的不舒服。")
  end
