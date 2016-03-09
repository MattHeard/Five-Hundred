class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    CardDealtToTheSouthernPlayer.create!(card: deck.sample, game: @game)
  end
end
