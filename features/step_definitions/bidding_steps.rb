Then(/^the bidder is on the dealer's left$/) do
  game = Game.find(@id)
  game_state = GameState.for(game)
  dealer = game_state.dealer
  bidder = game_state.bidder
  expect(bidder).to be NextPlayer.new(dealer).call
end

Then(/^the bidder is chosen$/) do
  game = Game.find(@id)
  game_state = GameState.for(game)
  @bidder = game_state.bidder
  expect(@bidder).not_to be nil
end

When(/^the bidder passes$/) do
  game = Game.find(@id)
  PassBid.new(game).call
end

Then(/^the bidder has changed$/) do
  game = Game.find(@id)
  new_bidder = GameState.for(game).bidder
  old_bidder = @bidder
  expect(new_bidder).not_to be old_bidder
end

Then(/^there are no bids$/) do
  game = Game.find(@id)
  bid_count = GameState.for(game).bid_count
  expect(bid_count).to eq 0
end

When(/^(\d+) bidders pass$/) do |number_of_bidders|
  game = Game.find(@id)
  number_of_bidders.to_i.times { PassBid.new(game).call }
end

Then(/^the dealer is the bidder$/) do
  game = Game.find(@id)
  game_state = GameState.for(game)
  expect(game_state.bidder).to be game_state.dealer
end

When(/^the (?:new )?bidder bids (\d+) Spades$/) do |number_of_tricks|
  game = Game.find(@id)
  trump_suit = "♠"
  MakeBid.new(game, number_of_tricks.to_i, trump_suit).call
end

Then(/^the bid is (\d+) Spades$/) do |number_of_tricks|
  game = Game.find(@id)
  game_state = GameState.for(game)
  expected_bid = "#{number_of_tricks}♠"
  expect(present(game_state.highest_bid)).to eq expected_bid
end

Then(/^the new bidder cannot bid (\d+) Spades$/) do |number_of_tricks|
  game = Game.find(@id)
  trump_suit = "♠"
  service = MakeBid.new(game, number_of_tricks.to_i, trump_suit)
  expect(service.call).to be false
end

Then(/^the highest bid is (\d+) Spades$/) do |number_of_tricks|
  game = Game.find(@id)
  highest_bid = GameState.for(game).highest_bid
  expected_bid = "#{number_of_tricks}♠"
  expect(present(highest_bid)).to eq expected_bid
end

Then(/^the deck is redealt$/) do
  game = Game.find(@id)
  RedealAllCards.new(game).call
end

def present(bid)
  "#{bid[:number_of_tricks]}#{bid[:trump_suit]}"
end
