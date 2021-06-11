class AddGradeToStudentAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :student_assignments, :grade, :integer
  end
end
