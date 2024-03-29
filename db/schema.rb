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

ActiveRecord::Schema.define(:version => 20120611180007) do

  create_table "agreements", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "content"
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "is_admin"
    t.integer  "user_amount"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "invitee_id"
    t.boolean  "is_active_admin"
    t.boolean  "is_active_user"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "client_email"
    t.integer  "client_id"
    t.boolean  "is_active"
    t.integer  "project_amount"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "rankings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "avgrank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "classification"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "description"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "rank"
    t.integer  "votee_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
