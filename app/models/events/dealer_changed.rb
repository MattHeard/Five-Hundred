class DealerChanged < Event
  def apply(game_state)
    game_state.dealer = player
  end

  private

  def player
    target_player.to_sym
  end
end
