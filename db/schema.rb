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

ActiveRecord::Schema.define(version: 20151104113841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

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
    t.string   "title"
    t.string   "category"
    t.text     "image_url"
    t.integer  "price"
    t.text     "short_description"
    t.integer  "rig_id"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "pedals", ["cached_votes_down"], name: "index_pedals_on_cached_votes_down", using: :btree
  add_index "pedals", ["cached_votes_score"], name: "index_pedals_on_cached_votes_score", using: :btree
  add_index "pedals", ["cached_votes_total"], name: "index_pedals_on_cached_votes_total", using: :btree
  add_index "pedals", ["cached_votes_up"], name: "index_pedals_on_cached_votes_up", using: :btree
  add_index "pedals", ["cached_weighted_average"], name: "index_pedals_on_cached_weighted_average", using: :btree
  add_index "pedals", ["cached_weighted_score"], name: "index_pedals_on_cached_weighted_score", using: :btree
  add_index "pedals", ["cached_weighted_total"], name: "index_pedals_on_cached_weighted_total", using: :btree

  create_table "pedals_rigs", id: false, force: :cascade do |t|
    t.integer "rig_id",   null: false
    t.integer "pedal_id", null: false
  end

  create_table "pedals_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "pedal_id", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "rigs", force: :cascade do |t|
    t.string   "guitarist"
    t.text     "rig_photo"
    t.text     "description"
    t.text     "comments"
    t.integer  "user_id"
    t.integer  "pedal_id"
    t.integer  "genre_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "guitarist_photo"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "guitarist_upload_image"
    t.string   "rig_upload_image"
  end

  add_index "rigs", ["cached_votes_down"], name: "index_rigs_on_cached_votes_down", using: :btree
  add_index "rigs", ["cached_votes_score"], name: "index_rigs_on_cached_votes_score", using: :btree
  add_index "rigs", ["cached_votes_total"], name: "index_rigs_on_cached_votes_total", using: :btree
  add_index "rigs", ["cached_votes_up"], name: "index_rigs_on_cached_votes_up", using: :btree
  add_index "rigs", ["cached_weighted_average"], name: "index_rigs_on_cached_weighted_average", using: :btree
  add_index "rigs", ["cached_weighted_score"], name: "index_rigs_on_cached_weighted_score", using: :btree
  add_index "rigs", ["cached_weighted_total"], name: "index_rigs_on_cached_weighted_total", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "pedal_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
