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

ActiveRecord::Schema.define(version: 20141204151008) do

  create_table "contract_comments", force: true do |t|
    t.integer  "contract_id"
    t.string   "komenti"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ndikues"
    t.string   "punetori"
  end

  add_index "contract_comments", ["contract_id"], name: "index_contract_comments_on_contract_id"

  create_table "contracts", force: true do |t|
    t.string   "numri_kontrates"
    t.integer  "sasia"
    t.decimal  "cmimi"
    t.integer  "avansi"
    t.decimal  "pjesa_mbetur_per_pagese"
    t.date     "koha_arritjes_port"
    t.date     "koha_reale_arritjes_port"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.integer  "item_id"
    t.boolean  "kompletuar"
  end

  add_index "contracts", ["item_id"], name: "index_contracts_on_item_id"
  add_index "contracts", ["supplier_id"], name: "index_contracts_on_supplier_id"

  create_table "departments", force: true do |t|
    t.string   "departamenti"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "emertimi"
    t.text     "pershkrimi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
    t.integer  "department_id"
  end

  add_index "items", ["department_id"], name: "index_items_on_department_id"
  add_index "items", ["unit_id"], name: "index_items_on_unit_id"

  create_table "leaves", force: true do |t|
    t.string   "arsyetimi"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "dita_pare"
    t.date     "dalja_ne_pune"
  end

  add_index "leaves", ["user_id", "created_at"], name: "index_leaves_on_user_id_and_created_at"
  add_index "leaves", ["user_id"], name: "index_leaves_on_user_id"

  create_table "njesia", force: true do |t|
    t.string   "njesia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "emri"
    t.string   "telefoni"
    t.string   "emaili"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "njesia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: true do |t|
    t.integer  "user_id"
    t.integer  "contract_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["contract_comment_id"], name: "index_updates_on_contract_comment_id"
  add_index "updates", ["user_id"], name: "index_updates_on_user_id"

  create_table "users", force: true do |t|
    t.string   "emri"
    t.string   "emaili"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "picture"
    t.string   "remember_token"
    t.integer  "departamenti_id"
    t.integer  "department_id"
  end

  add_index "users", ["departamenti_id"], name: "index_users_on_departamenti_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["emaili"], name: "index_users_on_emaili", unique: true

end
