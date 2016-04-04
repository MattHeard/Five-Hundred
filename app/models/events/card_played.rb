require 'pp'

class CardPlayed < Event
  def apply(game_state)
    @game_state = game_state

    game_state.hand(player).delete(card)
    trick.play(player, card)
    game_state.current_player_seat = next_player_seat

    update_scores

    game_state
  end

  private

  attr_reader :game_state

  def next_player_seat
    NextPlayer.new(game_state.current_player_seat).call
  end

  def player
    player_seat.to_sym
  end

  def update_scores
    update_trick_scores if trick.complete?
  end

  def update_trick_scores
    increase_winning_team_trick_score
  end

  def increase_winning_team_trick_score
    increase_trick_score(trick.winning_team)
  end

  def increase_trick_score(team)
    trick_scores[team] += 1
  end

  def trick_scores
    game_state.scoreboard.trick_scores
  end

  def trick
    game_state.trick
  end
end
