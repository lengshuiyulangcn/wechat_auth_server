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

ActiveRecord::Schema.define(version: 20170404095638) do

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_tags", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id", "tag_id"], name: "index_user_tags_on_user_id_and_tag_id", unique: true
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "avatar_url"
    t.string   "open_id"
    t.string   "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "account_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "agreement"
  end

end
