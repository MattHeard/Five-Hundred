class CardDealtToTheWesternPlayer < Event
  def apply(game_state)
    game_state.remove_from_deck(card)
    game_state.hands[:west] << card

    true
  end
end
