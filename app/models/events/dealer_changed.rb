class DealerChanged < Event
  def apply(game_state)
    game_state.dealer = player
    game_state.bidder = NextPlayer.new(game_state.dealer).call

    game_state
  end

  private

  def player
    target_player.to_sym
  end
end
