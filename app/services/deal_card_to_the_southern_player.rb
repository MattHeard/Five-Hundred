class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    card = deck.sample
    event = CardDealtToTheSouthernPlayer.build(card)
    @game.add_event(event)
  end
end
