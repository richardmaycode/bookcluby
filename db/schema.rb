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

ActiveRecord::Schema.define(version: 2020_07_05_024623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.integer "pages"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "established"
    t.integer "books_per_month"
    t.integer "minimum_planned_months"
    t.integer "maximum_voting_sessions"
    t.string "invite_code"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.boolean "eligible", default: true
    t.boolean "approved", default: false
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_recommendations_on_book_id"
    t.index ["group_id"], name: "index_recommendations_on_group_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "voting_session_recommendations", force: :cascade do |t|
    t.bigint "voting_session_id"
    t.bigint "recommendation_id"
    t.string "outcome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendation_id"], name: "index_voting_session_recommendations_on_recommendation_id"
    t.index ["voting_session_id"], name: "index_voting_session_recommendations_on_voting_session_id"
  end

  create_table "voting_sessions", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "status"
    t.integer "maximum_books_per_person"
    t.integer "recommendation_lead_days"
    t.integer "maximum_books_to_plan"
    t.date "recommedation_deadline"
    t.date "voting_date"
    t.date "completion_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_voting_sessions_on_group_id"
  end

  add_foreign_key "books", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "recommendations", "books"
  add_foreign_key "recommendations", "groups"
  add_foreign_key "recommendations", "users"
  add_foreign_key "voting_sessions", "groups"
end
