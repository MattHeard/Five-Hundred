class CardPlayed < Event
  POINTS_PER_TRICK = 10

  def apply(game_state)
    @game_state = game_state

    # TODO Extract these three lines into play_card method
    hand.delete(card)
    trick.play(seat, card)
    game_state.current_player_seat = next_player_seat

    update_scores

    game_state
  end

  private

  attr_reader :game_state

  def hand
    game_state.player(seat).hand
  end

  def next_player_seat
    NextSeat.new(game_state.current_player_seat).call
  end

  def seat
    player_seat.to_sym
  end

  def update_scores
    increase_trick_score(trick.winning_team) if trick.complete?
    convert_tricks_to_points if round_complete?
  end

  def increase_trick_score(team)
    trick_scores[team] += 1
  end

  def trick_scores
    scoreboard.trick_scores
  end

  def trick
    game_state.trick
  end

  # TODO Clarify naming of "trick scores" and "tricks count"
  def convert_tricks_to_points
    trick_scores.each do |team, tricks_count|
      points[team] += tricks_count * POINTS_PER_TRICK;
    end

    scoreboard.reset_trick_scores
  end

  # TODO Inline
  def points
    scoreboard.points
  end

  def scoreboard
    game_state.scoreboard
  end

  def round_complete?
    game_state.complete_round?
  end
end
