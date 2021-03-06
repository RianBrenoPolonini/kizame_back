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

ActiveRecord::Schema[7.0].define(version: 2022_06_19_190617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "classroms", force: :cascade do |t|
    t.string "name"
    t.text "day", default: [], array: true
    t.text "time", default: [], array: true
    t.bigint "modality_id", null: false
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modality_id"], name: "index_classroms_on_modality_id"
    t.index ["user_id"], name: "index_classroms_on_user_id"
  end

  create_table "modalities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "modality_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["modality_id"], name: "index_users_on_modality_id"
  end

  add_foreign_key "classroms", "modalities"
  add_foreign_key "users", "modalities"
end
