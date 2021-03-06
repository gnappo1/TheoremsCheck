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

ActiveRecord::Schema.define(version: 20171111013612) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "created_by"
  end

  create_table "corollaries", force: :cascade do |t|
    t.string   "name"
    t.text     "statement"
    t.text     "demonstration"
    t.integer  "scientist_id"
    t.integer  "theorem_id"
    t.integer  "area_id"
    t.integer  "subject_id"
    t.string   "created_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "corollaries_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "corollary_id", null: false
    t.index ["corollary_id", "user_id"], name: "index_corollaries_users_on_corollary_id_and_user_id"
    t.index ["user_id", "corollary_id"], name: "index_corollaries_users_on_user_id_and_corollary_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "text"
    t.integer  "scientist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "created_by"
  end

  create_table "scientists", force: :cascade do |t|
    t.string   "full_name"
    t.integer  "year_of_birth"
    t.integer  "year_of_death"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "created_by"
  end

  create_table "scientists_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "scientist_id", null: false
    t.index ["scientist_id", "user_id"], name: "index_scientists_users_on_scientist_id_and_user_id"
    t.index ["user_id", "scientist_id"], name: "index_scientists_users_on_user_id_and_scientist_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "created_by"
  end

  create_table "theorems", force: :cascade do |t|
    t.string   "name"
    t.text     "statement"
    t.text     "demonstration"
    t.integer  "scientist_id"
    t.integer  "area_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "subject_id"
    t.string   "created_by"
  end

  create_table "theorems_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "theorem_id", null: false
    t.index ["theorem_id", "user_id"], name: "index_theorems_users_on_theorem_id_and_user_id"
    t.index ["user_id", "theorem_id"], name: "index_theorems_users_on_user_id_and_theorem_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.text     "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
