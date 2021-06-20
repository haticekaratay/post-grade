class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :student_assignments
    has_many :assignments, through: :student_assignments

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def assignment_grade(assignment,student)
        student_assignment_array = StudentAssignment.where(["assignment_id = #{assignment.id} and student_id = #{student.id}"])

        if student_assignment_array.length == 0
            "N/A"
        elsif student_assignment_array.first.grade == nil
            "N/A"
        else 
            student_assignment_array.first.grade 
        end 
       #byebug
    end

    def average(assignments,student)
        student_score_total = 0
        max_score_total = 0
        assignment_count = 0
        assignments.each_with_index do |assignment,index|
            if self.assignment_grade(assignment,student).is_a? Numeric
                student_score_total += self.assignment_grade(assignment,student)
                max_score_total += assignment.max
                assignment_count = index
            end
        end
        average = student_score_total/max_score_total.to_f*100
        average.round
    end

    def letter_grade(assignments,student)
        if average(assignments,student) >= 90
            "A"
        elsif average(assignments,student) >= 80 && average(assignments,student) < 90
            "B"
        elsif average(assignments,student) >= 70 && average(assignments,student) < 80
            "C"
        elsif average(assignments,student) >= 60 && average(assignments,student) < 70
            "D"
        else
            "F"
        end
    end


    
end

