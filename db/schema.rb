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

ActiveRecord::Schema.define(version: 20150802143210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "descriptions", force: :cascade do |t|
    t.integer  "idea_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "descriptions", ["idea_id"], name: "index_descriptions_on_idea_id", using: :btree

  create_table "ideas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "brief"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "team_id"
  end

  add_index "ideas", ["brief"], name: "index_ideas_on_brief", using: :btree
  add_index "ideas", ["team_id"], name: "index_ideas_on_team_id", using: :btree
  add_index "ideas", ["title"], name: "index_ideas_on_title", using: :btree
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["provider", "uid"], name: "index_identities_on_provider_and_uid", unique: true, using: :btree
  add_index "identities", ["user_id", "provider"], name: "index_identities_on_user_id_and_provider", unique: true, using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invitations", ["team_id"], name: "index_invitations_on_team_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resources", ["idea_id"], name: "index_resources_on_idea_id", using: :btree
  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "username"
    t.string   "image_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "team_id"
    t.string   "team_role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["idea_id"], name: "index_votes_on_idea_id", using: :btree
  add_index "votes", ["user_id", "idea_id"], name: "unique_votes_index", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "ideas", "teams"
  add_foreign_key "identities", "users"
  add_foreign_key "invitations", "teams"
  add_foreign_key "invitations", "users"
  add_foreign_key "users", "teams"
  add_foreign_key "votes", "ideas"
  add_foreign_key "votes", "users"
end
