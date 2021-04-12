class Purchase < ApplicationRecord
  PAYMETHODS = ['Credit Card', 'Cash on Delivery', 'Konbini']
  DELIVERTYPES = ['Regular', 'Express', 'next day delivery']
  belongs_to :user
  belongs_to :user_game
  validates :payment_method, inclusion: { in: PAYMETHODS }
  validates :delivery_type, inclusion: { in: DELIVERTYPES }
end
