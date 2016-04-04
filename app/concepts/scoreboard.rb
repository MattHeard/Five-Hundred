class Scoreboard
  DEFAULT_TRICK_SCORES = { north_south: 0, west_east: 0 }

  attr_accessor :trick_scores

  def initialize
    self.trick_scores = DEFAULT_TRICK_SCORES.dup
  end
end
