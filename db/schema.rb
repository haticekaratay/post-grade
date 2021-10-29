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

ActiveRecord::Schema.define(version: 2021_06_11_211108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "due_date"
    t.string "assignment_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_assignments_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "student_assignments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "assignment_id", null: false
    t.boolean "is_applicable?", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "grade"
    t.index ["assignment_id"], name: "index_student_assignments_on_assignment_id"
    t.index ["student_id"], name: "index_student_assignments_on_student_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "prerequisite", default: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "grade_level"
    t.datetime "birthday"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "teacher_id", null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assignments", "courses"
  add_foreign_key "courses", "teachers"
  add_foreign_key "student_assignments", "assignments"
  add_foreign_key "student_assignments", "students"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "students", "teachers"
end
