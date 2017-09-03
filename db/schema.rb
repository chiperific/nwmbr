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

ActiveRecord::Schema.define(version: 20170831042633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "location"
    t.string "comment"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "link_flags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "link_id", null: false
    t.string "comment", null: false
    t.integer "flagged_by", null: false
    t.datetime "flagged_at", null: false
    t.integer "resolved_by"
    t.datetime "resolved_at"
    t.boolean "resolved_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_link_flags_on_link_id"
    t.index ["user_id"], name: "index_link_flags_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url", null: false
    t.string "comment"
    t.string "location", null: false
    t.string "author_name", null: false
    t.string "author_url"
    t.boolean "approved"
    t.datetime "approved_at"
    t.integer "approved_by"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "user_flags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "comment"
    t.integer "flagged_by", null: false
    t.datetime "flagged_at", null: false
    t.integer "resolved_by"
    t.datetime "resolved_at"
    t.boolean "resolved_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_flags_on_user_id"
  end

  create_table "user_tracks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "role_assigned"
    t.string "role_requested", default: "Guest", null: false
    t.integer "approved_by"
    t.datetime "approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "Guest", null: false
    t.string "username", null: false
    t.boolean "archived", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "link_flags", "links"
  add_foreign_key "link_flags", "users"
  add_foreign_key "link_flags", "users", column: "resolved_by"
  add_foreign_key "links", "users"
  add_foreign_key "links", "users", column: "approved_by"
  add_foreign_key "user_flags", "users"
  add_foreign_key "user_flags", "users", column: "flagged_by"
  add_foreign_key "user_flags", "users", column: "resolved_by"
  add_foreign_key "user_tracks", "users"
  add_foreign_key "user_tracks", "users", column: "approved_by"
end
