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

ActiveRecord::Schema.define(version: 20150127004956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "encrypted_access_token"
    t.string   "client_name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "encrypted_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_caretakers", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_vital_signs", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "vital_sign_id"
    t.string   "units"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "measured_at"
  end

  add_index "patient_vital_signs", ["patient_id"], name: "index_patient_vital_signs_on_patient_id", using: :btree
  add_index "patient_vital_signs", ["vital_sign_id"], name: "index_patient_vital_signs_on_vital_sign_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "encrypted_last_name"
    t.string   "encrypted_first_name"
    t.date     "dob"
    t.string   "encrypted_ssn"
    t.string   "encrypted_gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_organizations", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_organizations", ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
  add_index "user_organizations", ["user_id"], name: "index_user_organizations_on_user_id", using: :btree

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
    t.string   "last_name"
    t.string   "first_name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vital_signs", force: :cascade do |t|
    t.string "name"
  end

end
