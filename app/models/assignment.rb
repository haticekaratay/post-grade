class Assignment < ApplicationRecord
    has_many :students, through: :student_assignments
end
