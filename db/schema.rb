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

ActiveRecord::Schema.define(version: 20161018051104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_chat_rooms_on_profile_id", using: :btree
  end

  create_table "diver_reviews", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "diver_review"
    t.integer  "diver_rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id"], name: "index_diver_reviews_on_profile_id", using: :btree
  end

  create_table "location_lists", force: :cascade do |t|
    t.integer  "profile_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "type_of_dive"
    t.datetime "time_window"
    t.integer  "location_id"
    t.index ["profile_id"], name: "index_location_lists_on_profile_id", using: :btree
  end

  create_table "location_reviews", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "location_id"
    t.text     "review"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_location_reviews_on_location_id", using: :btree
    t.index ["profile_id"], name: "index_location_reviews_on_profile_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location_name"
    t.string   "description"
    t.string   "depth"
    t.string   "difficulty"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "location_lists_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["location_lists_id"], name: "index_locations_on_location_lists_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "profile_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["profile_id"], name: "index_messages_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_dives"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chat_rooms", "profiles"
  add_foreign_key "diver_reviews", "profiles"
  add_foreign_key "location_lists", "profiles"
  add_foreign_key "location_reviews", "locations"
  add_foreign_key "location_reviews", "profiles"
  add_foreign_key "locations", "location_lists", column: "location_lists_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "profiles"
  add_foreign_key "profiles", "users"
end
