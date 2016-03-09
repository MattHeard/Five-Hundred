class Deck
  def initialize(game)
    @game = game
  end

  def call
    GameState.for(@game).deck
  end
end
