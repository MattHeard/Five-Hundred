Then(/^the bidder is on the dealer's left$/) do
  game = Game.find(@id)
  game_state = GameState.for(game)
  dealer = game_state.dealer
  bidder = game_state.bidder
  expect(bidder).to be left_of(dealer)
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
  bids = GameState.for(game).bids
  expect(bids).to be_empty
end

def left_of(player)
  player_index = Game::PLAYERS.index(player)
  size = Game::PLAYERS.size
  Game::PLAYERS[(player_index + 1) % size]
end
