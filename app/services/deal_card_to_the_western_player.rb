class DealCardToTheWesternPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = GameState.for(@game).deck
    CardDealt.create!(card: deck.sample, target_player: :west, game: @game)
  end
end
