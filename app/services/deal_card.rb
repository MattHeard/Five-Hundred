class DealCard
  def initialize(game, player)
    @game, @player = game, player
  end

  def call
    deck = GameState.for(@game).deck
    CardDealt.create!(card: deck.sample, target_player: @player, game: @game)
  end
end
