# TODO Split into PickRandomDealer and RotateDealer
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
    current_dealer_seat ? rotate_seat : random_seat
  end

  def rotate_seat
    NextSeat.new(current_dealer_seat).call
  end

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
