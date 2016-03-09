class DealCard
  def initialize(game, player)
    @game, @player = game, player
  end

  def call
    @game.with_lock do
      deck = GameState.for(@game).deck
      CardDealt.create!(card: deck.sample, target_player: @player, game: @game)
    end
  end
end
