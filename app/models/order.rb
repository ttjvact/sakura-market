class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :address
  belongs_to :payment
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :delivery_date, presence: true, format: { with: DATE_REGEX } 
end
