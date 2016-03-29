class DealerChanged < Event
  def apply(game_state)
    game_state.dealer_seat = dealer_seat
    game_state.current_player_seat = seat_clockwise_from_dealer

    game_state
  end

  private

  def seat_clockwise_from_dealer
    NextPlayer.new(dealer_seat).call
  end

  def dealer_seat
    player_seat.to_sym
  end
end
