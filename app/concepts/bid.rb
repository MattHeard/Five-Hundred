class Bid
  attr_reader :bidder, :number_of_tricks, :trump_suit

  def initialize(args)
    @passed = args[:passed]
    @bidder = args[:bidder]
    @number_of_tricks = args[:number_of_tricks]
    @trump_suit = args[:trump_suit]
  end

  def passed?
    @passed
  end

  def >(other)
    other.nil? || more_tricks?(other) || higher_suit?(other)
  end

  private

  def more_tricks?(other)
    number_of_tricks > other.number_of_tricks
  end

  def higher_suit?(other)
    trump_rank(trump_suit) > trump_rank(other.trump_suit)
  end

  def trump_rank(suit)
    %w{ ♠ ♣ ♦ ♥ }.index(suit)
  end
end
