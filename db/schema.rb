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

ActiveRecord::Schema.define(version: 20130927092819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.integer  "city_id"
    t.string   "address"
    t.string   "name"
    t.integer  "area"
    t.string   "opening_hours"
    t.integer  "status_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree
  add_index "places", ["status_cd"], name: "index_places_on_status_cd", using: :btree

end
