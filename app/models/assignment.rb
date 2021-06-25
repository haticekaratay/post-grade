class Assignment < ApplicationRecord
    belongs_to :course
    has_many :student_assignments , dependent: :destroy
    has_many :students, through: :student_assignments
    
    validates_presence_of :name, :description, :max, :due_date
    validates :max, numericality: { only_integer: true } 

    scope :sort_by_due_date, ->{self.order(due_date: :asc)}

    def number_of_student_assigned
        StudentAssignment.where("assignment_id = ? ", "#{self.id}").count
    end


end
