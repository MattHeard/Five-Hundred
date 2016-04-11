class DealerRotated < Event
  # TODO Use player object instead of seat
  def apply(game_state)
    @game_state = game_state

    rotate_dealer 
    update_current_player

    game_state
  end

  private

  attr_reader :game_state

  def update_current_player
    game_state.current_player_seat = next_seat
  end

  def rotate_dealer
    game_state.dealer_seat = next_seat
  end

  def next_seat
    NextSeat.new(game_state.dealer_seat).call
  end
end
