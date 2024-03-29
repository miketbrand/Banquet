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

ActiveRecord::Schema.define(version: 20191120232209) do

  create_table "aggregates", force: :cascade do |t|
    t.string   "aggType"
    t.string   "aggStatus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banquets", force: :cascade do |t|
    t.integer  "hostID"
    t.string   "banquet_name"
    t.integer  "zip_code"
    t.datetime "start"
    t.datetime "end"
    t.float    "entryPrice"
    t.integer  "entryLimit"
  end

  create_table "events", force: :cascade do |t|
    t.integer "aggregate_id"
    t.string  "eventType"
    t.text    "eventData"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "fromID"
    t.integer "toID"
    t.integer "banquetID"
    t.float   "amount"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "password"
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.integer "zip_code"
  end

end
