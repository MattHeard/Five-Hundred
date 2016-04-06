class BidsReset < Event
  def apply(game_state)
    game_state.reset_bids

    game_state
  end
end
