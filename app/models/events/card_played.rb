class CardPlayed < Event
  def apply(game_state)
    game_state.hand(player).delete(card)
    game_state.trick[player] = card

    game_state
  end

  private

  def player
    player_seat.to_sym
  end
end
