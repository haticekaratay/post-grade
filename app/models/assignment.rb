class Assignment < ApplicationRecord
    belongs_to :course
    has_many :student_assignments , dependent: :destroy
    has_many :students, through: :student_assignments
    
    validates_presence_of :name, :description, :max, :due_date
    validates :max, numericality: { only_integer: true } 

    def number_of_student_assigned
        StudentAssignment.where("assignment_id = ? ", "#{self.id}").count
    end

end
