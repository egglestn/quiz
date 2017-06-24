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

ActiveRecord::Schema.define(version: 20170624084747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "content_id"
    t.index ["content_id"], name: "index_answers_on_content_id", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.string   "text"
    t.string   "key"
    t.integer  "section"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "category"
    t.integer  "next_id"
    t.string   "footnotes"
    t.index ["content_id"], name: "index_contents_on_content_id", using: :btree
    t.index ["next_id"], name: "index_contents_on_next_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.integer  "answers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "prev"
    t.integer  "next"
    t.integer  "section"
    t.index ["answers_id"], name: "index_questions_on_answers_id", using: :btree
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
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers", "contents"
  add_foreign_key "contents", "contents"
  add_foreign_key "questions", "answers", column: "answers_id"
end
