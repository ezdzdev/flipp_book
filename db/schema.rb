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

ActiveRecord::Schema.define(version: 20160316184534) do

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",   limit: 256
    t.string   "last_name",    limit: 256
    t.string   "image_url",    limit: 1023
    t.string   "email",        limit: 254
    t.string   "phone_number", limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", using: :btree
  add_index "profiles", ["first_name"], name: "index_profiles_on_first_name", using: :btree
  add_index "profiles", ["last_name"], name: "index_profiles_on_last_name", using: :btree

  create_table "profiles_tags", force: :cascade do |t|
    t.integer "profile_id", limit: 4
    t.integer "tag_id",     limit: 4
  end

  add_index "profiles_tags", ["profile_id"], name: "index_profiles_tags_on_profile_id", using: :btree
  add_index "profiles_tags", ["tag_id"], name: "index_profiles_tags_on_tag_id", using: :btree

  create_table "synonyms", force: :cascade do |t|
    t.integer "tag_id", limit: 4
    t.string  "name",   limit: 255, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",        limit: 256,  null: false
    t.string   "description", limit: 1200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

end
