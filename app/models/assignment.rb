class Assignment < ApplicationRecord
    belongs_to :course
    has_many :students, through: :student_assignments
end
