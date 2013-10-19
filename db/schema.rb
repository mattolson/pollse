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

ActiveRecord::Schema.define(:version => 20131019063307) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category_assignments", :force => true do |t|
    t.integer  "question_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "category_assignments", ["category_id"], :name => "index_category_assignments_on_category_id"
  add_index "category_assignments", ["question_id"], :name => "index_category_assignments_on_question_id"

  create_table "point_transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "points"
    t.string   "transaction_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "point_transactions", ["user_id"], :name => "index_point_transactions_on_user_id"

  create_table "polls", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "response_limit"
    t.boolean  "featured"
    t.boolean  "distribute"
    t.boolean  "vanity"
    t.boolean  "reveal_results"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "polls", ["question_id"], :name => "index_polls_on_question_id"
  add_index "polls", ["user_id"], :name => "index_polls_on_user_id"

  create_table "question_options", :force => true do |t|
    t.integer  "question_id"
    t.string   "response_value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "question_options", ["question_id"], :name => "index_question_options_on_question_id"

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "responses", ["poll_id"], :name => "index_responses_on_poll_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
