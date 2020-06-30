class Company < ApplicationRecord
    has_many :jobs
    has_many :contacts
    has_many :users, through: :jobs
end
