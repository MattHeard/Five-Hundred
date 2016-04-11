class PickRandomDealer
  def initialize(game)
    @game = game
  end

  def call
    game.with_lock { game.events << new_event }
  end

  private

  attr_reader :game

  def new_event
    RandomDealerPicked.new(player_seat: random_seat)
  end

  def random_seat
    seats.sample
  end

  def seats
    Seats.new.call
  end
end
