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
  expect(game_state.bidder).not_to be nil
end

When(/^the bidder passes$/) do
  game = Game.find(@id)
  PassBid.new(game).call
end

def left_of(player)
  player_index = Game::PLAYERS.index(player)
  size = Game::PLAYERS.size
  Game::PLAYERS[(player_index + 1) % size]
end
