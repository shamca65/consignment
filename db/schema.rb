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

ActiveRecord::Schema.define(version: 2019_12_27_220345) do

  create_table "configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 15
    t.datetime "current_pickup_date"
    t.index ["slug"], name: "index_configs_on_slug"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "email"
    t.boolean "active"
    t.datetime "acct_open_date"
    t.datetime "last_trans_date"
    t.integer "trans_type"
    t.integer "agreement_status"
    t.string "province"
    t.string "street_address"
    t.string "street_address2"
    t.string "city"
    t.string "postal"
    t.text "notes"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_customers_on_customer_id"
  end

  create_table "event_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "record_type"
    t.integer "record_id"
    t.string "record_action"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.decimal "price", precision: 8, scale: 2
    t.text "notes"
    t.string "type", limit: 10
    t.string "size"
    t.integer "photo_id"
    t.text "clerk"
    t.integer "status"
    t.datetime "sold_date"
    t.datetime "takein_date"
    t.date "pickup_date"
    t.datetime "payout_date"
    t.decimal "payout_amount", precision: 10
    t.decimal "owing_client", precision: 10
    t.decimal "paid_client", precision: 10
    t.string "gender", limit: 10
    t.string "item_type", limit: 10
    t.string "item_status", limit: 10
    t.decimal "payout_pct", precision: 8, scale: 2
    t.string "chk", limit: 5
    t.string "owner", limit: 15
    t.text "item_note"
    t.integer "takein_batch_number"
    t.bigint "item_id_id"
    t.bigint "item_id"
    t.datetime "sale_date"
    t.index ["customer_id"], name: "index_items_on_customer_id"
    t.index ["item_id"], name: "index_items_on_item_id"
    t.index ["item_id_id"], name: "index_items_on_item_id_id"
    t.index ["takein_batch_number"], name: "index_items_on_takein_batch_number"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "item_price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_no"
    t.bigint "item_id"
    t.datetime "sale_date"
    t.string "clerk", limit: 15
    t.index ["item_id"], name: "index_sale_items_on_item_id"
  end

  create_table "sale_summaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "sale_total", precision: 10
    t.bigint "order_no"
    t.datetime "sale_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "take_ins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "type"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "customers"
  add_foreign_key "items", "customers"
  add_foreign_key "items", "items"
end
