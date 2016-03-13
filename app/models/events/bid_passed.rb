class BidPassed < Event
  def apply(game_state)
    game_state.bidder = NextBidder.new(game_state).call
  end
end
