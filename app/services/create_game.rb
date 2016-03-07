class CreateGame
  def call
    game = Game.new
    game.shuffle_deck
    game.save!

    game
  end
end
