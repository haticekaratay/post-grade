class Teacher < ApplicationRecord
    has_many :courses
    has_many :students
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true , format: { with:  /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i }, length: { minimum: 4, maximum: 254 }
end
