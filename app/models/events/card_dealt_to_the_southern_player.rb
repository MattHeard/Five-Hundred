class CardDealtToTheSouthernPlayer < Event
  def apply(game_state)
    game_state.remove_from_deck(card)
    game_state.add_to_the_southern_hand(card)

    true
  end
end
