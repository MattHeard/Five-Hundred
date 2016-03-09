class DealCardToTheWesternPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = GameState.for(@game).deck
    CardDealtToTheWesternPlayer.create!(card: deck.sample, game: @game)
  end
end
