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

ActiveRecord::Schema[7.0].define(version: 2022_10_24_012508) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_categories_on_publisher_id", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.text "description"
    t.string "url"
    t.string "category"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_pictures_on_publisher_id"
  end

  create_table "publisher_categories", force: :cascade do |t|
    t.integer "publisher_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_publisher_categories_on_category_id", unique: true
    t.index ["publisher_id"], name: "index_publisher_categories_on_publisher_id", unique: true
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "publishers"
  add_foreign_key "pictures", "publishers"
  add_foreign_key "publisher_categories", "categories"
  add_foreign_key "publisher_categories", "publishers"
end
