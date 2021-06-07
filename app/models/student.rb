class Student < ApplicationRecord
    has_many :student_courses
    has_many :courses, through: :student_courses
    belongs_to :teacher
    has_many :student_assignments
    has_many :assignments, through: :student_assignments
end

