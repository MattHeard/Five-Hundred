class BidsReset < Event
  def apply(game_state)
    game_state.players.each { |player| player.pass(false) }
    game_state.highest_bid = nil

    game_state
  end
end
