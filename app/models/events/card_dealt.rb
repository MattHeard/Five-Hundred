class CardDealt < Event
  def apply(game_state)
    game_state.deck.delete(card)
    destination(game_state) << card
  end

  private

  def destination(game_state)
    player == :kitty ? game_state.kitty : game_state.hands[player]
  end

  def player
    target_player.to_sym
  end
end
