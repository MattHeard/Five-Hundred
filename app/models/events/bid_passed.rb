class BidPassed < Event
  def apply(game_state)
    @game_state = game_state

    bidder.pass

    # TODO Extract into GameState#rotate_current_player
    game_state.current_player_seat = next_player_seat(bidder.seat)

    game_state
  end

  private

  attr_reader :game_state

  def bidder
    game_state.bidder
  end

  def next_player_seat(player)
    NextSeat.new(player).call
  end
end
