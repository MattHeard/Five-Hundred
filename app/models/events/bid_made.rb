class BidMade < Event
  # TODO Rotate player seat with GameState method
  def apply(game_state)
    @game_state = game_state
    game_state.highest_bid = bid
    game_state.current_player_seat = next_player_seat(bidder_seat)

    game_state
  end

  private

  attr_reader :game_state

  # TODO Rename to next_seat
  def next_player_seat(seat)
    NextSeat.new(seat).call
  end

  def bid
    Bid.new(bid_args)
  end

  def bid_args
    {
      bidder: bidder,
      number_of_tricks: number_of_tricks,
      trump_suit: trump_suit
    }
  end

  # TODO Extract loop body into bidder_seat?(seat) method
  def bidder
    game_state.players.find { |player| player.seat == bidder_seat }
  end

  def bidder_seat
    game_state.current_player_seat
  end
end
