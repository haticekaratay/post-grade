class Assignment < ApplicationRecord
    belongs_to :course
    has_many :students, through: :student_assignments

    def number_of_student_assigned
        StudentAssignment.where("assignment_id = ? ", "#{self.id}").count
    end

end
