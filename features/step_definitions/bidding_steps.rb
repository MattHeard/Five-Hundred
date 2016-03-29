Then(/^the bidder is on the dealer's left$/) do
  dealer_seat = game_state.dealer_seat
  bidder_seat = game_state.current_player_seat
  expect(bidder_seat).to be NextPlayer.new(dealer_seat).call
end

Then(/^the bidder is chosen$/) do
  @bidder_seat = game_state.current_player_seat
  expect(@bidder_seat).not_to be nil
end

When(/^the bidder passes$/) do
  PassBid.new(game).call
end

Then(/^the bidder has changed$/) do
  new_bidder_seat = game_state.current_player_seat
  old_bidder_seat = @bidder_seat
  expect(new_bidder_seat).not_to be old_bidder_seat
end

Then(/^there are no bids$/) do
  bid_count = game_state.bid_count
  expect(bid_count).to eq 0
end

When(/^(?:the next )?(\d+) bidders pass$/) do |number_of_bidders|
  number_of_bidders.to_i.times { PassBid.new(game).call }
end

Then(/^the dealer is the bidder$/) do
  expect(game_state.current_player_seat).to be game_state.dealer_seat
end

When(/^the (?:new )?bidder bids (\d+) Spades$/) do |number_of_tricks|
  trump_suit = "♠"
  MakeBid.new(game, number_of_tricks.to_i, trump_suit).call
end

Then(/^the bid is (\d+) Spades$/) do |number_of_tricks|
  expected_bid = "#{number_of_tricks}♠"
  expect(present(game_state.highest_bid)).to eq expected_bid
end

Then(/^the new bidder cannot bid (\d+) Spades$/) do |number_of_tricks|
  trump_suit = "♠"
  service = MakeBid.new(game, number_of_tricks.to_i, trump_suit)
  expect(service.call).to be false
end

Then(/^the highest bid is (\d+) Spades$/) do |number_of_tricks|
  highest_bid = game_state.highest_bid
  expected_bid = "#{number_of_tricks}♠"
  expect(present(highest_bid)).to eq expected_bid
end

Then(/^the deck is redealt$/) do
  RedealAllCards.new(game).call
end

Then(/^the game is in the bidding phase$/) do
  expect(game_state).to be_in_bidding_phase
end

Then(/^the game is not in the bidding phase$/) do
  expect(game_state).not_to be_in_bidding_phase
end

Given(/^the bidding phase has completed$/) do
  number_of_tricks = 6
  trump_suit = "♠"
  MakeBid.new(game, number_of_tricks, trump_suit).call
  3.times { PassBid.new(game).call }
  expect(game_state).not_to be_in_bidding_phase
end

def present(bid)
  "#{bid.number_of_tricks}#{bid.trump_suit}"
end

def game_state
  CreateGameState.new(game).call
end

def game
  Game.find(@id)
end
