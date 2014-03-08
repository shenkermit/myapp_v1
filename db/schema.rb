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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140306072518) do

  create_table "branches", force: true do |t|
    t.string   "branch_code"
    t.string   "branch_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["branch_code"], name: "index_branches_on_branch_code", unique: true

  create_table "users", force: true do |t|
    t.string   "ename"
    t.string   "cname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "branch_code"
    t.string   "role_id",         default: "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
