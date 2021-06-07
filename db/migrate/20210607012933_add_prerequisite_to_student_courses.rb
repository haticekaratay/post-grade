class AddPrerequisiteToStudentCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :student_courses, :prerequisite, :boolean, default: false
  end
end
