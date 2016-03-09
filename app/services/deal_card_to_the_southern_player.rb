class DealCardToTheSouthernPlayer
  def initialize(game)
    @game = game
  end

  def call
    deck = GameState.for(@game).deck
    CardDealt.create!(card: deck.sample, target_player: :south, game: @game)
  end
end
