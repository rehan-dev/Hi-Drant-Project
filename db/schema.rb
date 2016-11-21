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

ActiveRecord::Schema.define(version: 20161121210408) do

  create_table "billentries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "truck_no"
    t.string   "company_name"
    t.string   "address"
    t.datetime "time_arrive"
    t.datetime "time_departure"
    t.date     "current_date"
    t.decimal  "supply_rate",          precision: 10
    t.decimal  "weight",               precision: 10
    t.decimal  "previous_amount",      precision: 10
    t.decimal  "current_total_amount", precision: 10
    t.decimal  "recieved_amount",      precision: 10
    t.decimal  "net_balance",          precision: 10
    t.decimal  "total_amount",         precision: 10
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_billentries_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "company_name"
    t.text     "company_address",   limit: 65535
    t.string   "contact_no"
    t.string   "company_reference"
    t.decimal  "previous_amount",                 precision: 10, scale: 2
    t.decimal  "net_balance",                     precision: 10, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "daytimes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "day_start"
    t.string   "day_off"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daytimes_on_user_id", using: :btree
  end

  create_table "trucks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "truck_no"
    t.string   "truck_driver"
    t.string   "driver_no"
    t.string   "day_start"
    t.string   "day_off"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "secure"
    t.index ["user_id"], name: "index_trucks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "billentries", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "daytimes", "users"
  add_foreign_key "trucks", "users"
end
