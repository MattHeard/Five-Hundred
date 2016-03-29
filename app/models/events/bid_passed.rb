class BidPassed < Event
  def apply(game_state)
    current_bidder = game_state.bidder
    game_state.players.select { |player| player.seat == current_bidder }.first.bid = Bid.new(passed: true)
    game_state.bidder = next_player(current_bidder)
    game_state.current_player = next_player(current_bidder)

    game_state
  end

  private

  def next_player(player)
    NextPlayer.new(player).call
  end
end
