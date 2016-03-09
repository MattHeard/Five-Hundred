class CardDealtToTheSouthernPlayer < Event
  def apply(game_state)
    game_state.deck.delete(card)
    game_state.hands[:south] << card

    true
  end
end
