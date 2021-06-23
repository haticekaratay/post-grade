class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :student_assignments
    has_many :assignments, through: :student_assignments

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def assignment_grade(assignment)
        student_assignment_array = StudentAssignment.where(["assignment_id = #{assignment.id} and student_id = #{self.id}"])

        if student_assignment_array.length == 0
            "N/A"
        elsif student_assignment_array.first.grade == nil
            "N/A"
        else 
            student_assignment_array.first.grade 
        end 
       #byebug
    end

    def average(assignments)
        student_score_total = 0
        max_score_total = 0
        #binding.pry
        assignments.each do |assignment|
            if self.assignment_grade(assignment).is_a? Numeric
                student_score_total += self.assignment_grade(assignment)
                max_score_total += assignment.max
                #binding.pry
            end
        end
        #binding.pry
        if max_score_total == 0
            "Error"
        else
            average = student_score_total/max_score_total.to_f*100
            average.round
        end
    end

    def letter_grade(assignments)
        if average(assignments) >= 90
            "A"
        elsif average(assignments) >= 80 && average(assignments) < 90
            "B"
        elsif average(assignments) >= 70 && average(assignments) < 80
            "C"
        elsif average(assignments) >= 60 && average(assignments) < 70
            "D"
        else
            "F"
        end
    end
    
end

