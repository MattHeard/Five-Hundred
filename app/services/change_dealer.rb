class ChangeDealer
  def initialize(game)
    @game = game
  end

  def call
    @game.with_lock do
      DealerChanged.create!(target_player: next_dealer, game: @game)
    end
  end

  private

  def next_dealer
    case GameState.for(@game).dealer
    when :north
      :east
    when :east
      :south
    when :south
      :west
    when :west
      :north
    else
      Game::PLAYERS.sample
    end
  end
end
