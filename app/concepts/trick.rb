class Trick
  def initialize(played_cards)
    @played_cards = played_cards
  end

  def complete?
    cards_count == players.size
  end

  # TODO Call player.team
  def winning_team
    team(winning_player)
  end

  def cards_count
    played_cards.size
  end

  def player_has_played?(player)
    played_cards[player].present?
  end

  def play(player, card)
    played_cards[player] = card
  end

  def scores
    Hash[ played_cards.map { |player, card| [player, card_scores[card]] } ]
  end

  def played_card(player)
    played_cards[player]
  end

  def discard
    self.played_cards = {}
  end

  private

  attr_accessor :played_cards

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

  # TODO Extract magic literal into constant
  # TODO Use tap to apply default value to constant
  def card_scores
    card_scores = {
      "JOKER" => 13, "J♠" => 12, "J♣" => 11, "A♠" => 10, "K♠" => 9, "Q♠" => 8,
      "10♠" => 7, "9♠" => 6, "8♠" => 5, "7♠" => 4, "6♠" => 3, "5♠" => 2
    }
    card_scores.default = 0

    card_scores
  end

  # TODO Rename to seats
  def players
    Seats.new.call
  end
end
