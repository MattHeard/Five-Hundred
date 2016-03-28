class BidMade < Event
  def apply(game_state)
    current_bidder = game_state.bidder
    game_state.bids[current_bidder] = bid
    game_state.last_bid = bid
    game_state.bidder = NextBidder.new(game_state).call

    game_state
  end

  private

  def bid
    {
      bid_or_pass: :bid,
      number_of_tricks: number_of_tricks,
      trump_suit: trump_suit
    }
  end
end
