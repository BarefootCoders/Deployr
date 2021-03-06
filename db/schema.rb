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

ActiveRecord::Schema.define(version: 20131123214605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: true do |t|
    t.integer  "project_id"
    t.boolean  "deployed"
    t.string   "branch_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "travis_id"
  end

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "github_repo"
    t.string   "deploy_repo"
    t.text     "deploy_public_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "travis_token"
    t.string   "github_token"
    t.string   "heroku_token"
  end

  create_table "workspaces", force: true do |t|
    t.text     "path"
    t.string   "status"
    t.integer  "build_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
