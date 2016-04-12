module GamesHelper
  def unicode_card(name)
    {
      "BACK" => "🂠", "JOKER" => "🃟",

      "A♠" => "🂡", "K♠" => "🂮", "Q♠" => "🂭", "J♠" => "🂫", "10♠" => "🂪",
      "9♠" => "🂩", "8♠" => "🂨", "7♠" => "🂧", "6♠" => "🂦", "5♠" => "🂥",

      "A♣" => "🃑", "K♣" => "🃞", "Q♣" => "🃝", "J♣" => "🃛", "10♣" => "🃚",
      "9♣" => "🃙", "8♣" => "🃘", "7♣" => "🃗", "6♣" => "🃖", "5♣" => "🃕",

      "A♥" => "🂱", "K♥" => "🂾", "Q♥" => "🂽", "J♥" => "🂻", "10♥" => "🂺",
      "9♥" => "🂹", "8♥" => "🂸", "7♥" => "🂷", "6♥" => "🂶", "5♥" => "🂵",
      "4♥" => "🂴",

      "A♦" => "🃁", "K♦" => "🃎", "Q♦" => "🃍", "J♦" => "🃋", "10♦" => "🃊",
      "9♦" => "🃉", "8♦" => "🃈", "7♦" => "🃇", "6♦" => "🃆", "5♦" => "🃅",
      "4♦" => "🃄"
    }[name]
  end

  def colour(card)
    return :black if %w{ JOKER BACK }.include?(card)
    suit = card.chars.last
    { "♠" => :black, "♣" => :black, "♥" => :red, "♦" => :red }[suit]
  end

  def pretty_bid(bid)
    "#{bid.number_of_tricks}#{bid.trump_suit}"
  end

  def team(team)
    { north_south: "North-South", west_east: "West-East" }[team]
  end
end
