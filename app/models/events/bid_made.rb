class BidMade < Event
  def apply(game_state)
    game_state.bids << bid(game_state)
    game_state.bidder = NextBidder.new(game_state).call
  end

  private

  def bid(game_state)
    {
      bidder: game_state.bidder,
      number_of_tricks: number_of_tricks,
      trump_suit: trump_suit
    }
  end
end
