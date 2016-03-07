class AddEncodedDeckToGames < ActiveRecord::Migration
  def change
    add_column :games, :encoded_deck, :string, null: false, default: ""
  end
end
