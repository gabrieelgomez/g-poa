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

ActiveRecord::Schema.define(version: 20180508145442) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "appearances", force: :cascade do |t|
    t.string   "image_background", limit: 255
    t.string   "theme_name",       limit: 255
    t.string   "setting_id",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "customizes", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.boolean  "installed",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "google_analytics_settings", force: :cascade do |t|
    t.string   "ga_account_id",  limit: 255
    t.string   "ga_tracking_id", limit: 255
    t.boolean  "ga_status",      limit: 1
    t.integer  "setting_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "meta_tags", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.text     "meta_tags",   limit: 65535
    t.string   "url",         limit: 255
    t.integer  "position",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.integer  "operative_plan_id",   limit: 4
    t.string   "title",               limit: 255
    t.string   "municipio",           limit: 255
    t.float    "budget",              limit: 24
    t.string   "budget_clasificador", limit: 255
    t.string   "cantidad",            limit: 255
    t.string   "product",             limit: 255
    t.string   "trimestre",           limit: 255
    t.text     "description",         limit: 65535
    t.integer  "position",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "array_presupuesto",   limit: 65535
    t.float    "presupuesto",         limit: 24
  end

  add_index "objectives", ["operative_plan_id"], name: "index_objectives_on_operative_plan_id", using: :btree

  create_table "operative_plans", force: :cascade do |t|
    t.string   "responsible_actor", limit: 255
    t.text     "national_plan",     limit: 65535
    t.text     "state_plan",        limit: 65535
    t.string   "district",          limit: 255
    t.string   "program",           limit: 255
    t.string   "subprogram",        limit: 255
    t.string   "project",           limit: 255
    t.text     "objective",         limit: 65535
    t.integer  "position",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "responsables", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.integer  "age",               limit: 4
    t.integer  "operative_plan_id", limit: 4
    t.integer  "position",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "responsables", ["operative_plan_id"], name: "index_responsables_on_operative_plan_id", using: :btree

  create_table "responsables_tasks", id: false, force: :cascade do |t|
    t.integer "task_id",        limit: 4
    t.integer "responsable_id", limit: 4
  end

  add_index "responsables_tasks", ["responsable_id"], name: "index_responsables_tasks_on_responsable_id", using: :btree
  add_index "responsables_tasks", ["task_id"], name: "index_responsables_tasks_on_task_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "scaffolds", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "fields",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "scripts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "script",     limit: 65535
    t.string   "url",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "phone",       limit: 255
    t.string   "mobile",      limit: 255
    t.string   "email",       limit: 255
    t.string   "logo",        limit: 255
    t.string   "favicon",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "smtp_settings", force: :cascade do |t|
    t.string   "address",     limit: 255
    t.string   "port",        limit: 255
    t.string   "domain_name", limit: 255
    t.string   "email",       limit: 255
    t.string   "password",    limit: 255
    t.integer  "setting_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string   "facebook",    limit: 255
    t.string   "twitter",     limit: 255
    t.string   "instagram",   limit: 255
    t.string   "google_plus", limit: 255
    t.string   "tripadvisor", limit: 255
    t.string   "pinterest",   limit: 255
    t.string   "flickr",      limit: 255
    t.string   "behance",     limit: 255
    t.string   "dribbble",    limit: 255
    t.string   "tumblr",      limit: 255
    t.string   "github",      limit: 255
    t.string   "linkedin",    limit: 255
    t.string   "soundcloud",  limit: 255
    t.string   "youtube",     limit: 255
    t.string   "skype",       limit: 255
    t.string   "vimeo",       limit: 255
    t.integer  "setting_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.integer  "objective_id", limit: 4
    t.integer  "position",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tasks", ["objective_id"], name: "index_tasks_on_objective_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "avatar",                 limit: 255
    t.string   "name",                   limit: 255
    t.string   "permalink",              limit: 255
    t.string   "username",               limit: 255
    t.datetime "deleted_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "objectives", "operative_plans"
  add_foreign_key "responsables_tasks", "responsables"
  add_foreign_key "responsables_tasks", "tasks"
  add_foreign_key "tasks", "objectives"
end
