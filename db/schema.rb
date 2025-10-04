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

ActiveRecord::Schema[8.0].define(version: 2025_09_30_153025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "by_lines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "copies", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "condition_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collection_id", null: false
    t.bigint "cover_id", null: false
    t.index ["collection_id"], name: "index_copies_on_collection_id"
    t.index ["condition_id"], name: "index_copies_on_condition_id"
    t.index ["cover_id"], name: "index_copies_on_cover_id"
    t.index ["issue_id"], name: "index_copies_on_issue_id"
  end

  create_table "covers", force: :cascade do |t|
    t.string "variant"
    t.bigint "issue_id", null: false
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_covers_on_issue_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "by_line_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "issue_id", null: false
    t.bigint "cover_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["by_line_id"], name: "index_credits_on_by_line_id"
    t.index ["cover_id"], name: "index_credits_on_cover_id"
    t.index ["creator_id"], name: "index_credits_on_creator_id"
    t.index ["issue_id"], name: "index_credits_on_issue_id"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "number"
    t.integer "legacy_number"
    t.datetime "cover_date"
    t.bigint "publication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_issues_on_publication_id"
  end

  create_table "publication_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.integer "start_date"
    t.integer "end_date"
    t.integer "volume"
    t.bigint "publication_type_id", null: false
    t.bigint "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_type_id"], name: "index_publications_on_publication_type_id"
    t.index ["publisher_id"], name: "index_publications_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "collections", "users"
  add_foreign_key "copies", "collections"
  add_foreign_key "copies", "conditions"
  add_foreign_key "copies", "covers"
  add_foreign_key "copies", "issues"
  add_foreign_key "covers", "issues"
  add_foreign_key "credits", "by_lines"
  add_foreign_key "credits", "covers"
  add_foreign_key "credits", "creators"
  add_foreign_key "credits", "issues"
  add_foreign_key "issues", "publications"
  add_foreign_key "publications", "publication_types"
  add_foreign_key "publications", "publishers"
end
