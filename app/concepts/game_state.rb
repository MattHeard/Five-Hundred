class GameState
  attr_accessor :deck, :kitty, :dealer_seat, :last_bid,
    :players, :trick, :current_player_seat

  # TODO Extract hand and bid into a Player object
  def initialize
    @deck = entire_deck
    @players = new_players
    @kitty = [ ]
    @last_bid = nil
    @trick = { }
  end

  def hands
    hands = { }
    players.each { |player| hands[player.seat] = player.hand }

    hands
  end

  def hand(seat)
    players.select { |player| player.seat == seat }.first.hand
  end

  def highest_bid
    last_bid
  end

  def bidder_has_previously_passed?
    bidder&.bid&.passed?
  end

  def bidder
    player(current_player_seat)
  end

  def player(seat)
    players.select { |player| player.seat == seat }.first
  end

  def bid_count
    players.map(&:bid).compact.count { |bid| !bid.passed? }
  end

  def in_bidding_phase?
    deck.empty? && !all_players_have_bid_or_passed?
  end

  def in_play_phase?
    deck.empty? && all_players_have_bid_or_passed? && !complete_trick?
  end

  def all_players_have_bid_or_passed?
    players.map(&:bid).compact.count == players.size
  end

  def card_played?(player)
    trick[player].present?
  end

  def complete_trick?
    trick.values.compact.size == players.size
  end

  private

  def entire_deck
    EntireDeck.new.call
  end

  def seats
    Players.new.call
  end

  def new_players
    seats.map { |seat| Player.new(seat) }
  end
end
