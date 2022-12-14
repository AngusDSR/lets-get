# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_05_201221) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "street_address"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "place_id"
    t.float "rating", default: 0.0
    t.boolean "current_search", default: true
  end

  create_table "meets", force: :cascade do |t|
    t.string "name"
    t.float "start_point_lat"
    t.float "start_point_long"
    t.float "friend_lat"
    t.float "friend_long"
    t.float "midpoint_lat"
    t.float "midpoint_long"
    t.text "directions", array: true
    t.integer "radius", default: 100
    t.boolean "active", default: true
    t.bigint "user_id", null: false
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "modes", array: true
    t.string "duration"
    t.text "friend_directions", array: true
    t.index ["business_id"], name: "index_meets_on_business_id"
    t.index ["user_id"], name: "index_meets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meets", "businesses"
  add_foreign_key "meets", "users"
end
