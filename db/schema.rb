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

ActiveRecord::Schema.define(version: 2020_01_09_143035) do

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "city"
    t.string "country"
    t.string "zip"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.string "addressable_type"
    t.integer "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.string "type"
    t.string "size"
    t.string "url"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_images_on_property_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "description"
    t.decimal "price", precision: 6, scale: 2
    t.integer "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "width", precision: 6, scale: 2, default: "0.0"
    t.decimal "length", precision: 6, scale: 2, default: "0.0"
    t.integer "property_type"
    t.string "title"
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

end
