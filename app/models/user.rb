class User < ApplicationRecord
    has_many :addresses
    has_many :orders
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, length: { minimum: 8 }, presence: true, allow_nil: true
end
