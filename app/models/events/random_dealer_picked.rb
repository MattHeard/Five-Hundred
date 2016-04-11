class RandomDealerPicked < Event
  def apply(game_state)
    @game_state = game_state

    change_dealer
    change_current_player

    game_state
  end

  private

  attr_reader :game_state

  # TODO Use player object instead of seat
  def change_dealer
    game_state.dealer_seat = new_dealer_seat 
  end

  def new_dealer_seat
    player_seat.to_sym
  end

  # TODO Use player object instead of seat
  def change_current_player
    game_state.current_player_seat = next_seat
  end

  def next_seat
    NextSeat.new(game_state.dealer_seat).call
  end
end
