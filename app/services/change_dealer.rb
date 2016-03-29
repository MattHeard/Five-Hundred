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
    DealerChanged.create!(target_player: next_dealer_seat, game: game)
  end

  def next_dealer_seat
    current_dealer_seat = CreateGameState.new(game).call.dealer_seat
    if current_dealer_seat.nil?
      Players.new.call.sample
    else
      NextPlayer.new(current_dealer_seat).call
    end
  end
end
