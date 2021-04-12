class CreateUserGames < ActiveRecord::Migration[5.2]
  def change
    create_table :user_games do |t|
      t.string :photo
      t.integer :sale_price
      t.string :description
      t.integer :shipping_price
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
