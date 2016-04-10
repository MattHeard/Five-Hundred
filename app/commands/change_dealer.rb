class ChangeDealer
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { create_event }
  end

  private

  attr_reader :game

  def create_event
    DealerChanged.create!(player_seat: next_dealer_seat, game: game)
  end

  def next_dealer_seat
    current_dealer_seat = CreateGameState.new(game).call.dealer_seat
    if current_dealer_seat.nil?
      Seats.new.call.sample
    else
      NextSeat.new(current_dealer_seat).call
    end
  end
end
