class CardDealtToTheWesternPlayer < Event
  def apply(game_state)
    game_state.remove_from_deck(card)
    game_state.add_card_to_hand(card, :west)

    true
  end
end
