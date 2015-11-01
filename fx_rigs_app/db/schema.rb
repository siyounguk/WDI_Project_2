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

ActiveRecord::Schema.define(version: 20151101145058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre_name"
    t.integer  "rig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedals", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.text     "pedal_photo"
    t.integer  "price_paid"
    t.text     "review"
    t.integer  "rig_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rigs", force: :cascade do |t|
    t.string   "guitarist"
    t.text     "rig_photo"
    t.text     "description"
    t.text     "comments"
    t.integer  "user_id"
    t.integer  "pedal_id"
    t.integer  "genre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "pedal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
