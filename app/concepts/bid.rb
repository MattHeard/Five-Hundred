class Bid
  attr_reader :number_of_tricks, :trump_suit

  def initialize(args)
    @passed = args[:passed]
    @number_of_tricks = args[:number_of_tricks]
    @trump_suit = args[:trump_suit]
  end

  def passed?
    @passed
  end
end
