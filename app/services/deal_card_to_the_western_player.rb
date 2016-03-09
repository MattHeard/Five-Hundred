class DealCardToTheWesternPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    card = deck.sample
    event = CardDealtToTheWesternPlayer.new(card: card)
    @game.add_event(event)
  end
end
