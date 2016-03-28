class CardDealt < Event
  def apply(game_state)
    game_state.deck.delete(card)
    destination(game_state) << card

    game_state
  end

  private

  def destination(game_state)
    player == :kitty ? game_state.kitty : game_state.hand(player)
  end

  def player
    target_player.to_sym
  end
end
