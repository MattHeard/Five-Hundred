class PlayCard
  def initialize(game, player, card)
    @game, @player, @card = game, player, card
  end

  def call
    game.with_lock { game.events << new_event }
  end

  private

  attr_accessor :game, :player, :card

  def new_event
    CardPlayed.create!(player_seat: player, card: card)
  end
end
