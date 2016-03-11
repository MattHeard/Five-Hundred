class AddTrumpSuitToEvents < ActiveRecord::Migration
  def change
    add_column :events, :trump_suit, :string
  end
end
