class BidPassed < Event
  def apply(game_state)
    current_bidder = game_state.bidder_seat
    game_state.players.select { |player| player.seat == current_bidder }.first.bid = Bid.new(passed: true)
    game_state.bidder_seat = next_player(current_bidder)
    game_state.current_player_seat = next_player(current_bidder)

    game_state
  end

  private

  def next_player(player)
    NextPlayer.new(player).call
  end
end
