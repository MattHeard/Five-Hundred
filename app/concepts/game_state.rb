class GameState
  attr_accessor :deck, :kitty, :dealer_seat, :highest_bid,
    :players, :trick, :current_player_seat, :scoreboard

  def initialize
    reset_deck
    @players = new_players
    @kitty = []
    @trick = Trick.new({})
    @scoreboard = new_scoreboard
  end

  def current_player
    player(current_player_seat)
  end

  def player(seat)
    players.find { |player| player.seat == seat }
  end

  def all_players_have_passed?
    players.all?(&:passed?)
  end

  def all_players_have_bid_or_passed?
    players.all? { |player| passed_or_bid_last?(player) }
  end

  def phase
    if !deck.empty?
      :dealing
    elsif still_bidding?
      :bidding
    elsif !trick.complete?
      :play
    elsif !complete_round?
      :trick_scoring
    else
      :round_scoring
    end
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

  def new_scoreboard
    Scoreboard.new
  end

  def still_bidding?
    all_players_have_passed? || !all_players_have_bid_or_passed?
  end

  def passed_or_bid_last?(player)
    player == highest_bid&.bidder || player.passed?
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
