class SouthernHand
  def initialize(game)
    @game = game
  end

  def call
    GameState.for(@game).southern_hand
  end
end
