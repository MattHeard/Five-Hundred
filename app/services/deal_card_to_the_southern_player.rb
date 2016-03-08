class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    card = deck.sample
    event = CardDealtToTheSouthernPlayer.new(card)
    @game.events << event
    @game.save!
  end
end
