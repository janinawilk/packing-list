# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_08_090646) do
  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "item_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "item_id", null: false
    t.integer "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "tag_id"], name: "index_item_tags_on_item_id_and_tag_id", unique: true
    t.index ["item_id"], name: "index_item_tags_on_item_id"
    t.index ["tag_id"], name: "index_item_tags_on_tag_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "trip_filters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "tag_id", null: false
    t.integer "trip_id", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_trip_filters_on_tag_id"
    t.index ["trip_id"], name: "index_trip_filters_on_trip_id"
  end

  create_table "trip_items", force: :cascade do |t|
    t.boolean "added_manually", default: false, null: false
    t.datetime "created_at", null: false
    t.boolean "is_packed", default: false, null: false
    t.integer "item_id", null: false
    t.integer "trip_id", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trip_items_on_item_id"
    t.index ["trip_id"], name: "index_trip_items_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_tags", "items"
  add_foreign_key "item_tags", "tags"
  add_foreign_key "items", "categories"
  add_foreign_key "trip_filters", "tags"
  add_foreign_key "trip_filters", "trips"
  add_foreign_key "trip_items", "items"
  add_foreign_key "trip_items", "trips"
end
