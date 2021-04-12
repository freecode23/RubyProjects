class Game < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :user_games
  has_many :users, through: :user_games
  include PgSearch

  pg_search_scope :search_ncm,
  against: [ :name, :category, :mechanic ],
  using: {
      tsearch: { prefix: true }
    }


  # def search_by_name_and_category_and_mechanic

  # end
end
