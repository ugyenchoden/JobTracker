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

ActiveRecord::Schema[8.1].define(version: 2026_07_14_041416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", default: "", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.date "applied_on", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "position", default: "", null: false
    t.string "status", default: "applied", null: false
    t.datetime "updated_at", null: false
    t.text "url", default: "", null: false
    t.bigint "user_id", null: false
    t.index ["applied_on"], name: "index_job_applications_on_applied_on"
    t.index ["company_id"], name: "index_job_applications_on_company_id"
    t.index ["user_id", "status"], name: "index_job_applications_on_user_id_and_status"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_applications", "companies"
  add_foreign_key "job_applications", "users"
end
