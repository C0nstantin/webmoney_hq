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

ActiveRecord::Schema.define(version: 20161202140847) do

  create_table "webmoney_hq_items", force: :cascade do |t|
    t.date    "daterequest"
    t.integer "count"
    t.integer "operation_id"
    t.text    "description"
    t.boolean "istransaction"
    t.boolean "canaggregate"
    t.decimal "amount",        precision: 5, scale: 2
    t.string  "wmcurrency"
    t.index ["daterequest"], name: "index_webmoney_hq_items_on_daterequest"
  end

  create_table "webmoney_hq_requests", force: :cascade do |t|
    t.date     "daterequest"
    t.integer  "activeuser_daily"
    t.integer  "activeuser_weekly"
    t.integer  "activeuser_monthly"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["daterequest"], name: "index_webmoney_hq_requests_on_daterequest"
  end

  create_table "webmoney_hq_ulogs", force: :cascade do |t|
    t.bigint   "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
