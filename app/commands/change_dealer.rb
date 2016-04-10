# TODO Split into PickRandomDealer and RotateDealer
class ChangeDealer
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }
  end

  private

  attr_reader :game

  def new_event
    DealerChanged.new(player_seat: next_dealer_seat)
  end

  def next_dealer_seat
    current_dealer_seat ? next_seat : random_seat
  end

  def next_seat
    NextSeat.new(current_dealer_seat).call
  end

  # TODO Isolate dependency by moving Seats.new.call to seats method
  def random_seat
    Seats.new.call.sample
  end

  def current_dealer_seat
    game_state.dealer_seat
  end

  def game_state
    CreateGameState.new(game).call
  end
end
