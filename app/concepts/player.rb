class Player
  attr_reader :seat
  attr_accessor :hand, :played_card

  def initialize(seat)
    @seat = seat
    @hand = []
  end

  def name
    seat.to_s.titlecase
  end

  def discard_hand
    @hand = []
  end

  # Extract magic literal into global constant
  def team
    { north: :north_south, south: :north_south,
      west: :west_east, east: :west_east
    }[seat]
  end

  def pass(passed = true)
    @passed = passed
  end

  def passed?
    @passed
  end
end
