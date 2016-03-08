class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    card = deck.sample
    event = CardDealtToTheSouthernPlayer.new(card: card)
    @game.add_event(event)
  end
end
