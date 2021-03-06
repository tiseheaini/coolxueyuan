# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120920134223) do

  create_table "forgetpasswords", :force => true do |t|
    t.string   "user_name",                              :null => false
    t.string   "user_qq",                                :null => false
    t.string   "password_forget_hash",                   :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "read",                 :default => true
  end

  create_table "messages", :force => true do |t|
    t.integer  "senduser",                              :null => false
    t.integer  "receiveuser",                           :null => false
    t.text     "text"
    t.boolean  "senduser_delete",    :default => false
    t.boolean  "receiveuser_delete", :default => false
    t.boolean  "read",               :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name",                        :null => false
    t.integer  "topics_count", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "topic_id",   :null => false
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "replies", ["topic_id"], :name => "index_replies_on_topic_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "topics", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "node_id",                      :null => false
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "replies_count", :default => 0
  end

  add_index "topics", ["node_id"], :name => "index_topics_on_node_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                         :null => false
    t.string   "nickname"
    t.string   "password_hash",                    :null => false
    t.string   "password_salt",                    :null => false
    t.string   "state"
    t.string   "city"
    t.string   "photo"
    t.boolean  "gender"
    t.string   "qq"
    t.integer  "node_id",                          :null => false
    t.string   "schooldate"
    t.boolean  "monitor",       :default => false
    t.boolean  "admin",         :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "about"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
