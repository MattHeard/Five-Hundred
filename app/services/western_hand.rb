class WesternHand
  def initialize(game)
    @game = game
  end

  def call
    GameState.for(@game).western_hand
  end
end
