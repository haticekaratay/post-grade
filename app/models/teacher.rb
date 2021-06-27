class Teacher < ApplicationRecord
    has_many :courses
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true , format: { with:  /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i }, length: { minimum: 4, maximum: 254 }

    def self.from_omniauth(response)
        Teacher.find_or_create_by(provider: response[:provider], uid: response[:uid]) do |t|
            t.username = response['info']['name']
            t.email = ['info']['email']
            t.password = "passwordassignedrandomly#*40weqfnhiosd"
        end
    end
end
