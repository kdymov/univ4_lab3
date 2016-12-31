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

ActiveRecord::Schema.define(version: 20161226213256) do

  create_table "recharges", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "amount",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "recharges", ["user_id"], name: "fk_rails_a6e3257336", using: :btree

  create_table "tariffs", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "cost",        limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 255
    t.string   "password",   limit: 255
    t.string   "fullname",   limit: 255
    t.string   "phone",      limit: 255
    t.integer  "tariff_id",  limit: 4
    t.integer  "balance",    limit: 4
    t.boolean  "is_blocked"
    t.boolean  "is_admin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["tariff_id"], name: "fk_rails_52f4226974", using: :btree

  add_foreign_key "recharges", "users"
  add_foreign_key "users", "tariffs"
end
