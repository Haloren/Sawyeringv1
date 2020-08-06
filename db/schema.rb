# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_06_170610) do

  create_table "chores", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.text "description"
    t.integer "members_id", null: false
    t.integer "categories_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_id"], name: "index_chores_on_categories_id"
    t.index ["members_id"], name: "index_chores_on_members_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "member_chores", force: :cascade do |t|
    t.integer "members_id", null: false
    t.integer "chores_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chores_id"], name: "index_member_chores_on_chores_id"
    t.index ["members_id"], name: "index_member_chores_on_members_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chores", "categories", column: "categories_id"
  add_foreign_key "chores", "members", column: "members_id"
  add_foreign_key "member_chores", "chores", column: "chores_id"
  add_foreign_key "member_chores", "members", column: "members_id"
end
