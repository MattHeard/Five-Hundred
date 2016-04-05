class NextTrickStarted < Event
  def apply(game_state)
    game_state.trick.discard

    game_state
  end
end
