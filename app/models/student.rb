class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :student_assignments
    has_many :assignments, through: :student_assignments

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def student_grade_each_assignment(assignment,student)
        student_grade_array = StudentAssignment.where(["assignment_id = #{assignment.id} and student_id = #{student.id}"])
        if student_grade_array.length == 0
            "N/A"
        else
            student_grade_array.first.grade
        end 
    end

    
    def student_assignment_total_grade
        StudentAssignment.where("student_id =?", "#{self.id}").sum(:grade)
    end   
    
    def assignments_total_max
        total = 0
        self.assignments.each do |assignment|
            total += assignment.max
        end
        total
    end

    def average(assignments)
        average = student_assignment_total_grade/assignment_total_max.to_f*100
        average.to_i
    end

    
end

