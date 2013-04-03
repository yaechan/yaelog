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

ActiveRecord::Schema.define(:version => 20130303113942) do

  create_table "entries", :force => true do |t|
    t.integer  "member_id",                       :null => false
    t.string   "title",                           :null => false
    t.text     "body",                            :null => false
    t.string   "category",                        :null => false
    t.datetime "posted_at",                       :null => false
    t.string   "status",     :default => "draft", :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "entries", ["member_id"], :name => "index_entries_on_member_id"

  create_table "members", :force => true do |t|
    t.string   "name",              :null => false
    t.text     "comment",           :null => false
    t.date     "birthday",          :null => false
    t.string   "hometown",          :null => false
    t.string   "bloodtype",         :null => false
    t.string   "university",        :null => false
    t.string   "ability",           :null => false
    t.string   "hobby",             :null => false
    t.string   "merit",             :null => false
    t.string   "demerit",           :null => false
    t.string   "favorite_word",     :null => false
    t.string   "language",          :null => false
    t.string   "favorite_language", :null => false
    t.string   "favorite_tool",     :null => false
    t.string   "editor",            :null => false
    t.string   "hashed_password",   :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
