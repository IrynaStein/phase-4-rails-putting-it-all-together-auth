class User < ApplicationRecord
    has_many :recipes, dependent: :destroy

    has_secure_password
    
    validates :username, presence: true 
    validates :username, uniqueness: true
end
