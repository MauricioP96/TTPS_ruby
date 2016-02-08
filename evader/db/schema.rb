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

ActiveRecord::Schema.define(version: 20151216065300) do

  create_table "bills", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "details"
    t.float    "amount"
    t.date     "date"
    t.string   "receiver"
    t.string   "cuit_l"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bills", ["client_id"], name: "index_bills_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "gender"
    t.integer  "dni"
    t.string   "cu_type"
    t.string   "cu_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "type_cont"
    t.string   "value_cont"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id"

end
