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

ActiveRecord::Schema.define(version: 20160130203002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",                           null: false
    t.decimal  "inventory_amount", default: 0.0
    t.decimal  "density",          default: 1.0
    t.integer  "pg",               default: 100
    t.integer  "vg",               default: 0
    t.decimal  "nicotine",         default: 0.0
    t.decimal  "average_cost",     default: 0.0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "text",                        null: false
    t.string   "type",       default: "Note"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "notes", ["type"], name: "index_notes_on_type", using: :btree

  create_table "recipe_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recipe_categories", ["name"], name: "index_recipe_categories_on_name", using: :btree

end
