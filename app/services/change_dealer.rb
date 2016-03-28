class ChangeDealer
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  private

  def create_event
    DealerChanged.create!(target_player: next_dealer, game: game)
  end

  def next_dealer
    current_dealer = CreateGameState.new(game).call.dealer
    if current_dealer.nil?
      Players.new.call.sample
    else
      NextPlayer.new(current_dealer).call
    end
  end
end
