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

ActiveRecord::Schema.define(version: 20160930024650) do

  create_table "actuals", force: :cascade do |t|
    t.integer  "report_id",              limit: 4
    t.string   "actual_task_time_spent", limit: 255
    t.string   "actual_task_project",    limit: 255
    t.string   "actual_task",            limit: 255
    t.string   "task_no",                limit: 255
    t.string   "create_date",            limit: 255
    t.string   "user_id",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_id",   limit: 255
    t.string   "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.string "user_id",  limit: 255
    t.string "group_id", limit: 255
  end

  create_table "planneds", force: :cascade do |t|
    t.integer  "report_id",            limit: 4
    t.string   "planned_task_project", limit: 255
    t.string   "planned_task",         limit: 255
    t.string   "task_no",              limit: 255
    t.string   "create_date",          limit: 255
    t.string   "user_id",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "group_id",    limit: 255
    t.string   "user_id",     limit: 255
    t.string   "comment",     limit: 255
    t.string   "create_date", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id",         limit: 255
    t.string   "user_name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
  end

end
