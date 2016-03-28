class BidPassed < Event
  PASSING_BID = { bid_or_pass: :pass }
  def apply(game_state)
    current_bidder = game_state.bidder
    game_state.bids[current_bidder] = PASSING_BID
    game_state.bidder = NextBidder.new(game_state).call

    game_state
  end
end
