class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchases
  has_many :user_games
  has_many :games, through: :user_games
  mount_uploader :photo, PhotoUploader
  validates :username, presence: true
end
