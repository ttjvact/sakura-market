class User < ApplicationRecord
    has_many :addresses
    has_many :orders
    has_secure_password
end
