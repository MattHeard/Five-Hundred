class GameState
  attr_accessor :deck, :kitty, :dealer, :bidder, :bids, :last_bid,
    :players, :trick

  # TODO Extract hand and bid into a Player object
  def initialize
    @deck = EntireDeck.new.call
    @players = new_players
    @kitty = [ ]
    @bids = { }
    @last_bid = nil
    @trick = { }
  end

  def hands
    hands = { }
    players.each { |player| hands[player.seat] = player.hand }

    hands
  end

  def hand(seat)
    hands[seat]
  end

  def highest_bid
    last_bid
  end

  def bidder_has_previously_passed?
    bids[bidder].present? && bids[bidder][:bid_or_pass] == :pass
  end

  def bid_count
    bids.values.count { |bid| bid.present? && bid[:bid_or_pass] == :bid }
  end

  def in_bidding_phase?
    deck.empty? && !all_players_have_bid_or_passed?
  end

  def all_players_have_bid_or_passed?
    bids.values.compact.count == 4
  end

  def card_played?(player)
    trick[player].present?
  end

  def complete_trick?
    trick.values.any? && trick.values.all?
  end

  private

  def seats
    Players.new.call
  end

  def new_players
    seats.map { |seat| Player.new(seat) }
  end
end
