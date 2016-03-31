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
    phase == :bidding
  end

  def in_play_phase?
    phase == :play
  end

  def in_scoring_phase?
    phase == :scoring
  end

  def all_players_have_bid_or_passed?
    players.all?(&:bid)
  end

  def card_played?(player)
    trick[player].present?
  end

  def complete_trick?
    trick.values.compact.size == players.size
  end

  private

  def phase
    if !deck.empty?
      return :dealing
    elsif !all_players_have_bid_or_passed?
      return :bidding
    elsif !complete_trick?
      return :play
    else
      return :scoring
    end
  end

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
