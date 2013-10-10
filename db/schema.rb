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

ActiveRecord::Schema.define(version: 20131010114000) do

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

  create_table "event_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_users", ["event_id"], name: "index_event_users_on_event_id", using: :btree
  add_index "event_users", ["user_id"], name: "index_event_users_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "section_cd"
    t.text     "body"
    t.datetime "scheduled_at"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["section_cd"], name: "index_events_on_section_cd", using: :btree

  create_table "places", force: true do |t|
    t.integer  "city_id"
    t.string   "address"
    t.string   "name"
    t.integer  "area"
    t.string   "opening_hours"
    t.integer  "status_cd",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "time_zone",     default: "UTC"
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree
  add_index "places", ["owner_id"], name: "index_places_on_owner_id", using: :btree
  add_index "places", ["status_cd"], name: "index_places_on_status_cd", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promos", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "reservation_timestamps", force: true do |t|
    t.integer  "reservation_id"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservation_timestamps", ["reservation_id"], name: "index_reservation_timestamps_on_reservation_id", using: :btree

  create_table "reservations", force: true do |t|
    t.integer  "workstation_id"
    t.string   "state"
    t.integer  "master_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["master_id"], name: "index_reservations_on_master_id", using: :btree
  add_index "reservations", ["workstation_id"], name: "index_reservations_on_workstation_id", using: :btree

  create_table "samples", force: true do |t|
    t.integer  "master_id"
    t.integer  "service_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "samples", ["master_id"], name: "index_samples_on_master_id", using: :btree
  add_index "samples", ["service_id"], name: "index_samples_on_service_id", using: :btree

  create_table "services", force: true do |t|
    t.integer  "profile_cd"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["profile_cd"], name: "index_services_on_profile_cd", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "user_services", force: true do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_services", ["service_id"], name: "index_user_services_on_service_id", using: :btree
  add_index "user_services", ["user_id"], name: "index_user_services_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.integer  "gender_cd"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_cd",                default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["gender_cd"], name: "index_users_on_gender_cd", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workstations", force: true do |t|
    t.integer  "place_id"
    t.integer  "service_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workstations", ["place_id"], name: "index_workstations_on_place_id", using: :btree
  add_index "workstations", ["service_id"], name: "index_workstations_on_service_id", using: :btree

end
