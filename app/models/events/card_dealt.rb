class CardDealt < Event
  def apply(game_state)
    game_state.deck.delete(card)
    if player == :kitty
      game_state.kitty << card
    else
      game_state.hands[player] << card
    end
  end

  private

  def player
    target_player.to_sym
  end
end
