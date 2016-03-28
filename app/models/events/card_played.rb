class CardPlayed < Event
  def apply(game_state)
    game_state.hands[player].delete(card)
    game_state.trick[player] = card

    game_state
  end

  private

  def player
    target_player.to_sym
  end
end
