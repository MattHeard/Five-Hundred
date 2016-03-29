class BidMade < Event
  def apply(game_state)
    current_bidder = game_state.bidder
    game_state.players.select { |player| player.seat == current_bidder }.first.bid = bid
    game_state.last_bid = bid
    game_state.bidder = next_player(current_bidder)
    game_state.current_player = next_player(current_bidder)

    game_state
  end

  private

  def next_player(player)
    NextPlayer.new(player).call
  end

  def bid
    Bid.new(number_of_tricks: number_of_tricks, trump_suit: trump_suit)
  end
end
