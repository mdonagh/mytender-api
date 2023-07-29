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

ActiveRecord::Schema.define(version: 2023_07_29_132024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.integer "bytes"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "notes"
    t.string "address"
    t.boolean "recurring"
    t.integer "duration"
    t.datetime "start_time"
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latitude", "longitude", "start_time"], name: "index_shifts_on_latitude_and_longitude_and_start_time"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.citext "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "banner_url"
    t.string "headshot_url"
    t.integer "kind"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
