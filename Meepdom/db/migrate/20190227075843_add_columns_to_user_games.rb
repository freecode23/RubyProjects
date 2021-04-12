class AddColumnsToUserGames < ActiveRecord::Migration[5.2]
  def change
    add_column :user_games, :condition, :string
  end
end
