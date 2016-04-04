class Trick
  def initialize(played_cards)
    @played_cards = played_cards
  end

  def complete?
    played_cards.size == players.size
  end

  def winning_team
    team(winning_player)
  end

  private

  attr_reader :played_cards

  def team(player)
    if player == :north || player == :south
      :north_south
    else
      :west_east
    end
  end

  def winning_player
    played_cards.max_by { |_, card| card_scores[card] }.first
  end

  def card_scores
    card_scores = {
      "JOKER" => 13, "J♠" => 12, "J♣" => 11, "A♠" => 10, "K♠" => 9, "Q♠" => 8,
      "10♠" => 7, "9♠" => 6, "8♠" => 5, "7♠" => 4, "6♠" => 3, "5♠" => 2
    }
    card_scores.default = 0

    card_scores
  end

  def players
    Players.new.call
  end
end
