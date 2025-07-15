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

ActiveRecord::Schema[8.0].define(version: 2025_07_08_211316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "auth_entities", comment: "Authentication/access rights entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tracked_service_id", null: false
    t.boolean "active", default: true, null: false
    t.string "identifier", null: false, comment: "Username or other identifier"
    t.string "access_level", default: "user", null: false, comment: "Current access level"
    t.datetime "active_from", precision: nil
    t.datetime "active_until", precision: nil
    t.string "comment"
    t.jsonb "data", default: "{}", null: false, comment: "Custom extra data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tracked_service_id"], name: "index_auth_entities_on_tracked_service_id"
    t.index ["user_id"], name: "index_auth_entities_on_user_id"
  end

  create_table "tracked_services", comment: "Services which have auth data to be tracked", force: :cascade do |t|
    t.string "name", null: false
    t.string "comment"
    t.jsonb "data", default: "{}", null: false, comment: "Custom extra data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "login_code"
    t.datetime "login_code_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "auth_entities", "tracked_services"
  add_foreign_key "auth_entities", "users"
end
