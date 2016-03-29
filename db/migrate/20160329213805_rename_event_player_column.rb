class RenameEventPlayerColumn < ActiveRecord::Migration
  def change
    rename_column :events, :target_player, :player_seat
  end
end
