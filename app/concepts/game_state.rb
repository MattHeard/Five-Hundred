class GameState
  COMPLETE_DECK = %w{
    A♠ K♠ Q♠ J♠ 10♠ 9♠ 8♠ 7♠ 6♠ 5♠
    A♣ K♣ Q♣ J♣ 10♣ 9♣ 8♣ 7♣ 6♣ 5♣
    A♥ K♥ Q♥ J♥ 10♥ 9♥ 8♥ 7♥ 6♥ 5♥ 4♥
    A♦ K♦ Q♦ J♦ 10♦ 9♦ 8♦ 7♦ 6♦ 5♦ 4♦
    JOKER
  }

  attr_accessor :deck, :hands, :kitty, :dealer, :bidder, :bids, :last_bid,
    :players, :trick

  # TODO Investigate using a service
  # Should this be extracted into a service for the sake of preventing GameState
  # from knowing anything about Event?
  # Or is it okay, considering that this is a class method rather than an object
  # method?
  # Or should this be collapsed into the #initialize method?
  def self.for(game)
    game.events.inject(GameState.new) do |state, event|
      event.apply(state)
      state
    end
  end

  # TODO Extract hand and bid into a Player object
  def initialize
    @deck = COMPLETE_DECK.dup
    @players = Game::PLAYERS.map { |seat| Player.new(seat) }
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

  def highest_bid
    last_bid
  end

  def bidder_has_previously_passed?
    bidder.present? &&
      bids[bidder].present? &&
      bids[bidder][:bid_or_pass] == :pass
  end

  def bid_count
    bids.values.count { |bid| bid.present? && bid[:bid_or_pass] == :bid }
  end

  def in_bidding_phase?
    deck.empty? && !all_players_have_bid_or_passed? 
  end

  def all_players_have_bid_or_passed?
    bids.values.count { |bid| bid.present? } == 4
  end

  def card_played?(player)
    trick[player].present?
  end
end
