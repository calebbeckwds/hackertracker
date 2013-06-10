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

ActiveRecord::Schema.define(:version => 20130608113436) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "sequence"
  end

  create_table "caveats", :force => true do |t|
    t.integer  "fuid"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "fuid"
    t.string   "phone"
    t.string   "email"
    t.string   "name"
    t.string   "handle"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "fuid"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.string   "transaction_type"
    t.string   "email"
    t.string   "transactionid"
    t.datetime "transaction_time"
    t.string   "status"
    t.decimal  "amount",           :precision => 10, :scale => 0
    t.string   "currencycode"
    t.decimal  "feeamt",           :precision => 10, :scale => 0
    t.decimal  "netamt",           :precision => 10, :scale => 0
    t.string   "name"
    t.boolean  "dues",                                            :default => false
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "paypal_user"
    t.string   "paypal_pass"
    t.string   "paypal_signature"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tickets", :force => true do |t|
    t.integer  "fuid"
    t.integer  "user_id"
    t.boolean  "status"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tutorials", :force => true do |t|
    t.integer  "fuid"
    t.integer  "user_id"
    t.text     "body"
    t.text     "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "unique_items", :force => true do |t|
    t.boolean  "loggable"
    t.boolean  "ticketable"
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "fuid"
    t.integer  "area_id"
  end

  add_index "unique_items", ["fuid"], :name => "index_unique_items_on_fuid"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "handle"
    t.string   "release_authorization"
    t.string   "paypal_email"
    t.string   "keycard_number"
    t.date     "birthday"
    t.string   "phone_number"
    t.string   "mailing_address"
    t.string   "sponsor_1_name"
    t.string   "sponsor_2_name"
    t.string   "level"
    t.date     "date_of_form"
    t.date     "date_joined"
    t.string   "ec_name"
    t.string   "ec_relation"
    t.string   "ec_home"
    t.string   "ec_cell"
    t.string   "ec_second_name"
    t.string   "ec_second_relation"
    t.string   "ec_second_home"
    t.string   "ec_second_cell"
    t.string   "ec_allergies"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
