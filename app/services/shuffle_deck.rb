class ShuffleDeck
  def initialize(game)
    @game = game
  end

  def call
    @game.events = @game.events << DeckShuffled.build

    @game.update

    true
  end
end
