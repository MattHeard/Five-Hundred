class AddTargetPlayerToEvent < ActiveRecord::Migration
  def change
    add_column :events, :target_player, :string
  end
end
