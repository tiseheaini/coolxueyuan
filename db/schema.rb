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

ActiveRecord::Schema.define(:version => 20120827044921) do

  create_table "nodes", :force => true do |t|
    t.string   "name",                        :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "topics_count", :default => 0
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "topic_id",   :null => false
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "node_id",    :null => false
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",      :null => false
    t.string   "nickname"
    t.string   "password_hash", :null => false
    t.string   "password_salt", :null => false
    t.boolean  "gender"
    t.string   "qq"
    t.string   "schooldate"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "school",        :null => false
  end

end
