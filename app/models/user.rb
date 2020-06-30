class User < ApplicationRecord
    has_many :jobs
    has_many :companies, through: :jobs

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
