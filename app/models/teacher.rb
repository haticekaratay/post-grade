class Teacher < ApplicationRecord
    has_many :courses
    has_many :students
    has_secure_password
end
