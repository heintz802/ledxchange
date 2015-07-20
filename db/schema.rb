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

ActiveRecord::Schema.define(version: 20150717221411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  limit: nil, default: "", null: false
    t.string   "encrypted_password",     limit: nil, default: "", null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: nil
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: nil
    t.string   "name",                   limit: nil
    t.string   "phone",                  limit: nil
    t.boolean  "master"
    t.string   "position",               limit: nil
    t.string   "photo",                  limit: nil
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.integer "manufacturer_id"
    t.string  "image",                         limit: nil
    t.string  "model",                         limit: nil
    t.integer "product_id"
    t.text    "description"
    t.float   "power"
    t.integer "voltage_min"
    t.integer "voltage_max"
    t.integer "frequency_min"
    t.integer "frequency_max"
    t.integer "beam_angle"
    t.integer "cct"
    t.float   "lumens"
    t.integer "cbcp"
    t.integer "efficacy"
    t.integer "equivalent"
    t.string  "energy_star_status",            limit: nil
    t.string  "reference",                     limit: nil
    t.string  "upc",                           limit: nil
    t.string  "inner_carton_barcode",          limit: nil
    t.string  "outer_carton_barcode",          limit: nil
    t.integer "cri"
    t.float   "light_emitting_area"
    t.string  "led_type",                      limit: nil
    t.integer "life_time"
    t.integer "warranty"
    t.float   "diameter_width"
    t.float   "diameter_height"
    t.float   "lamp_weight"
    t.integer "case_qty_inner"
    t.integer "case_qty_outer"
    t.float   "inner_carton_diametter_width"
    t.float   "inner_carton_diametter_height"
    t.float   "inner_carton_diametter_weight"
    t.float   "outer_carton_diametter_width"
    t.float   "outer_carton_diametter_height"
    t.float   "outer_carton_diametter_weight"
    t.integer "pallet_qty"
    t.string  "product_data_sheet",            limit: nil
    t.string  "dimming_campatibility",         limit: nil
  end

  create_table "uploads", force: true do |t|
    t.string   "file"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
