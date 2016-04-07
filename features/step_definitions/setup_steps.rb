DECK = %w{
  A♣ 5♥ 5♠
  A♠ Q♥ 6♥
  4♥ 5♦ J♠
  K♠ 10♥ 7♦
  7♠
  A♥ 6♠ 10♦ K♥
  Q♣ K♣ 4♦ 6♦
  8♣ 5♣ 10♣ Q♠
  10♠ J♣ Q♦ J♥
  A♦
  8♦ 9♥ 7♣
  8♥ 7♥ K♦
  9♠ 6♣ JOKER
  9♦ 8♠ 9♣
  J♦
}

CARD_RECIPIENTS = %i{
  north north north
  south south south
  east east east
  west west west
  kitty

  north north north north
  south south south south
  east east east east
  west west west west
  kitty

  north north north
  south south south
  east east east
  west west west
  kitty
}

def game
  game = Game.create!
  deal_cards(game)
  set_dealer(game, :south)

  game
end

def deal_cards(game)
  DECK.each_with_index do |card, index|
    player_seat = CARD_RECIPIENTS[index]
    CardDealt.create!(card: card, player_seat: player_seat, game: game)
  end
end

def set_dealer(game, player_seat)
  DealerChanged.create!(player_seat: player_seat, game: game)
end

Given(/^the game is in the bidding phase$/) do
  url = "/games/#{game.id}"
  visit(url)
end

Given(/^the game is in the play phase$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^no points have been won$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^([^" ]*) reaches (-?\d+) points$/) do |team, points_count|
  pending # Write code here that turns the phrase above into concrete actions
end
