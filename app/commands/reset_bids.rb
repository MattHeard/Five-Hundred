class ResetBids
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { BidsReset.create(game: game) }
  end

  private

  attr_reader :game
end
