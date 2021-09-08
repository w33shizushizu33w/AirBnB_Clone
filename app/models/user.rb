class User < ApplicationRecord
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 } 
    validates :contuct_number, presence: true, length: { maximum: 50 }
    validates :profile, presence: false, length: { maximum: 140}
end
