class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :student_assignments
    has_many :assignments, through: :student_assignments

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def student_grade_by_assignment(assignment,student)
        StudentAssignment.where(["assignment_id = #{assignment.id} and student_id = #{student.id}"]).grade
    end
    
end

