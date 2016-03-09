class CardDealtToTheWesternPlayer < CardDealt
  def apply(game_state)
    game_state.deck.delete(card)
    game_state.hands[:west] << card

    true
  end
end
