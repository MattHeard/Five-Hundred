class DealCard
  attr_reader :game, :player

  def initialize(game, player)
    @game, @player = game, player
  end

  def call
    deal_card unless deck_empty?

    !deck_empty?
  end

  def deal_card
    game.with_lock do
      deck = GameState.for(game).deck
      CardDealt.create!(card: deck.sample, target_player: player, game: game)
    end
  end

  def deck_empty?
    GameState.for(game).deck.empty?
  end
end
