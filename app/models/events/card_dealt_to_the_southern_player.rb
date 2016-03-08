class CardDealtToTheSouthernPlayer < Event
  def apply(game_state)
    game_state.remove_from_deck(card)

    true
  end
end
