class ChangeDealer
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def call
    game.with_lock do
      DealerChanged.create!(target_player: next_dealer, game: game)
    end
  end

  private

  def next_dealer
    current_dealer = GameState.for(game).dealer
    if current_dealer.nil?
      Game::PLAYERS.sample
    else
      NextPlayer.new(current_dealer).call
    end
  end
end
