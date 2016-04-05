class AllCardsCollected < Event
  def apply(game_state)
    game_state.kitty = []
    game_state.players.each(&:discard_hand)
    game_state.reset_deck

    game_state
  end
end
