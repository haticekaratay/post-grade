class CreateStudentAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :student_assignments do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :assignment, null: false, foreign_key: true
      t.boolean :is_applicable?, default: true

      t.timestamps
    end
  end
end
