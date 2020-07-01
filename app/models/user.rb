class User < ApplicationRecord
    has_many :jobs
    has_many :companies, through: :jobs
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    # validates :email, presence: true
    # validates :email, uniqueness: true
end
