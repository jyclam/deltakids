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

ActiveRecord::Schema.define(version: 20170618023320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "date_start"
    t.string "date_end"
    t.boolean "repeat"
    t.bigint "age_group_id"
    t.bigint "program_id"
    t.bigint "organization_id"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone_num"
    t.string "time_start"
    t.string "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_activities_on_age_group_id"
    t.index ["organization_id"], name: "index_activities_on_organization_id"
    t.index ["program_id"], name: "index_activities_on_program_id"
  end

  create_table "age_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone_num"
    t.string "time_start"
    t.string "time_end"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_events_on_activity_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "phone_num"
    t.string "website"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_organizations_on_email", unique: true
    t.index ["title"], name: "index_organizations_on_title", unique: true
  end

  create_table "orgprograms", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_orgprograms_on_organization_id"
    t.index ["program_id"], name: "index_orgprograms_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_programs_on_category", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "website"
    t.string "logo"
    t.bigint "category_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  add_foreign_key "activities", "age_groups"
  add_foreign_key "activities", "organizations"
  add_foreign_key "activities", "programs"
  add_foreign_key "events", "activities"
  add_foreign_key "orgprograms", "organizations"
  add_foreign_key "orgprograms", "programs"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "organizations"
end
