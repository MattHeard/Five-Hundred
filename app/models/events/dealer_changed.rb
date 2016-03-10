class DealerChanged < Event
  def apply(game_state)
    game_state.dealer = player
    game_state.bidder = player_left_of(game_state.dealer)
  end

  private

  def player
    target_player.to_sym
  end

  def player_left_of(player)
    puts Game::PLAYERS.join(" ")
    index = Game::PLAYERS.index(player)
    size = Game::PLAYERS.size
    Game::PLAYERS[(index + 1) % size]
  end
end
