class BidPassed < Event
  def apply(game_state)
    game_state.bidder = next_bidder(game_state)
  end

  private

  def next_bidder(game_state)
    old_bidder = game_state.bidder
    index = Game::PLAYERS.index(old_bidder)
    size = Game::PLAYERS.size
    Game::PLAYERS[(index + 1) % size]
  end
end
