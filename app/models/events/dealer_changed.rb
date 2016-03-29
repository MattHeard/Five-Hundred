class DealerChanged < Event
  def apply(game_state)
    game_state.dealer = dealer
    game_state.bidder_seat = player_clockwise_from_dealer
    game_state.current_player_seat = player_clockwise_from_dealer

    game_state
  end

  private

  def player_clockwise_from_dealer
    NextPlayer.new(dealer).call
  end

  def dealer
    target_player.to_sym
  end
end
