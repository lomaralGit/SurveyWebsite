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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_035428) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "presentation_id", null: false
    t.string "feedback"
    t.integer "score"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_feedbacks_on_presentation_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.string "name"
    t.integer "final_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "presentation_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_teams_on_presentation_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.boolean "privileged"
    t.string "name"
    t.string "username"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "feedbacks", "presentations"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "teams", "presentations"
  add_foreign_key "teams", "users"
end
