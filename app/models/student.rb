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
       #byebug
    end

    def average(assignments,student)
        student_score_total = 0
        max_score_total = 0
        assignment_count = 0
        assignments.each_with_index do |assignment,index|
            if self.student_grade_each_assignment(assignment,student).is_a? Numeric
                student_score_total += self.student_grade_each_assignment(assignment,student)
                max_score_total += assignment.max
                assignment_count = index
            end
        end
        average = student_score_total/max_score_total.to_f*100
        average.round
    end


    
    def student_assignment_total_grade
        StudentAssignment.where("student_id =?", "#{self.id}").sum(:grade)
    end   
    
    def assignment_total_max
        total = 0
        self.assignments.each do |assignment|
            total += assignment.max
        end
        total
    end

    def average1
        average = student_assignment_total_grade/assignment_total_max.to_f*100
        average.round
    end

    def letter_grade
        if average >= 90
            "A"
        elsif average >= 80 && average < 90
            "B"
        elsif average >= 70 && average < 80
            "C"
        elsif average >= 60 && average < 70
            "D"
        else
            "F"
        end
    end


    
end

