class AddCardToEvent < ActiveRecord::Migration
  def change
    add_column :events, :card, :string
  end
end
