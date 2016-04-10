# TODO Make some methods private
class GameState
  attr_accessor :deck, :kitty, :dealer_seat, :highest_bid,
    :players, :trick, :current_player_seat, :scoreboard

  def initialize
    reset_deck
    @players = new_players
    @kitty = []
    @trick = Trick.new({})
    @scoreboard = Scoreboard.new
  end

  def current_player
    player(current_player_seat)
  end

  def player(seat)
    players.find { |player| player.seat == seat }
  end

  def all_players_have_passed?
    players.count(&:passed?) == players_count
  end

  def all_players_have_bid_or_passed?
    players.select { |player| player == highest_bid&.bidder || player.passed? }.size == players.size
  end

  def players_count
    players.size
  end

  def card_played?(player)
    trick.player_has_played?(player)
  end

  def complete_trick?
    trick.cards_count == players.size
  end

  def phase
    if !deck.empty?
      return :dealing
    elsif still_bidding?
      return :bidding
    elsif !complete_trick?
      return :play
    elsif !complete_round?
      return :trick_scoring
    else
      return :round_scoring
    end
  end

  def still_bidding?
    all_players_have_passed? || !all_players_have_bid_or_passed?
  end

  def trick_winning_player
    player_with_highest_trick_card_score
  end

  def complete_round?
    players.map(&:hand).flatten.none?
  end

  def reset_deck
    self.deck = entire_deck
  end

  def contract
    highest_bid if phase != :bidding
  end

  private

  def player_with_highest_trick_card_score
    player(seat_of_player_with_highest_trick_card_score)
  end

  def seat_of_player_with_highest_trick_card_score
    trick.scores.max_by { |_, card_score| card_score }.first
  end

  # TODO Extract magic literal into constant
  def card_scores
    card_scores = {
      "JOKER" => 13, "J♠" => 12, "J♣" => 11, "A♠" => 10, "K♠" => 9, "Q♠" => 8,
      "10♠" => 7, "9♠" => 6, "8♠" => 5, "7♠" => 4, "6♠" => 3, "5♠" => 2
    }
    card_scores.default = 0

    card_scores
  end

  def entire_deck
    EntireDeck.new.call
  end

  def seats
    Seats.new.call
  end

  def new_players
    seats.map { |seat| Player.new(seat) }
  end
end
