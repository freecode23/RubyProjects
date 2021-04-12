class UserGame < ApplicationRecord
  CONDITIONS = ['like new', 'good', 'OK', 'damaged', 'missing pieces']
  belongs_to :user
  belongs_to :game
  has_one :purchase
  validates :condition, inclusion: { in: CONDITIONS }
  validates :sale_price, presence: true, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader
end
