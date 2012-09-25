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

  User.create(:username => '123456', 
	            :nickname => 'nickname2', 
							:password => '123456', 
							:gender => '0', 
							:qq => '844583686', 
							:node_id => '2', 
							:schooldate => '2012-08-27 10:34:50')
	
  User.create(:username => '12345', 
	            :nickname => 'nickname', 
							:password => '12345', 
							:gender => '0', 
							:qq => '844583686', 
							:node_id => '3', 
							:schooldate => '2012-08-27 10:34:50')
	
	Topic.delete_all

	300.times do |n|
		Topic.create(:user_id => '1',
		             :node_id => '1',
								 :title => "#{n}主题",
								 :text => "第#{n}个内容")
	end

	300.times do |n|
		Topic.create(:user_id => '2',
		             :node_id => '1',
								 :title => "#{n}主题",
								 :text => "第#{n}个内容")
	end
