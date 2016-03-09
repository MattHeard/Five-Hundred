class CardDealtToTheSouthernPlayer < Event
  def apply(game_state)
    game_state.remove_from_deck(card)
    game_state.hands[:south] << card

    true
  end
end
