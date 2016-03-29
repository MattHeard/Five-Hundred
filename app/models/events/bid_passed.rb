class BidPassed < Event
  PASSING_BID = { bid_or_pass: :pass }

  def apply(game_state)
    current_bidder = game_state.bidder
    game_state.bids[current_bidder] = PASSING_BID
    game_state.bidder = next_player(current_bidder)
    game_state.current_player = next_player(current_bidder)

    game_state
  end

  private

  def next_player(player)
    NextPlayer.new(player).call
  end
end
