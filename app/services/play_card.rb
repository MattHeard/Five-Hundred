class PlayCard
  def initialize(game, player, card)
    @game, @player, @card = game, player, card
  end

  def call
    game.with_lock { create_event }
  end

  private

  def create_event
    CardPlayed.create!(target_player: player, game: game, card: card)
  end

  attr_accessor :game, :player, :card
end
