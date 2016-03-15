class AddNumberOfTricksToEvent < ActiveRecord::Migration
  def change
    add_column :events, :number_of_tricks, :integer
  end
end
