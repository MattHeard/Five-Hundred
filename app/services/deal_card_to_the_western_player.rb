class DealCardToTheWesternPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = Deck.new(@game).call
    CardDealtToTheWesternPlayer.create!(card: deck.sample, game: @game)
  end
end
