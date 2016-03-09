class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = GameState.for(@game).deck
    CardDealtToTheSouthernPlayer.create!(card: deck.sample, game: @game)
  end
end
