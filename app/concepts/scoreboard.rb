class Scoreboard
  DEFAULT_SCORES = { north_south: 0, west_east: 0 }

  attr_accessor :trick_scores
  attr_accessor :points

  def initialize
    reset_trick_scores
    self.points = DEFAULT_SCORES.dup
  end

  def reset_trick_scores
    self.trick_scores = DEFAULT_SCORES.dup
  end
end
