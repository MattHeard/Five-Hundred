class NextBidder
  def initialize(game_state)
    @game_state = game_state
  end

  def call
    old_bidder = @game_state.bidder
    index = Game::PLAYERS.index(old_bidder)
    size = Game::PLAYERS.size
    Game::PLAYERS[(index + 1) % size]
  end
end
