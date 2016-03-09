class DealCardToTheWesternPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    card = deck.sample
    CardDealtToTheWesternPlayer.create!(card: card, game: @game)
  end
end
