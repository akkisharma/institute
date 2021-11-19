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

ActiveRecord::Schema.define(version: 2021_11_18_115234) do

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "credits", precision: 8, scale: 2, null: false
    t.integer "months_duration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "mobile", null: false
    t.date "doj", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_tutors_on_course_id"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["mobile"], name: "index_tutors_on_mobile", unique: true
  end

  add_foreign_key "tutors", "courses"
end
