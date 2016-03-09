class CardDealt < Event
  def apply(game_state)
    game_state.deck.delete(card)
    game_state.hands[player] << card
  end

  private

  def player
    target_player.to_sym
  end
end
