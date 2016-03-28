When(/^the south player plays a card$/) do
  game = Game.find(@id)
  player = :south
  game_state = CreateGameState.new(game).call
  southern_hand = game_state.hand(player)
  card = southern_hand.first
  PlayCard.new(game, player, card).call
end

When(/^all players play a card$/) do
  game = Game.find(@id)
  game_state = CreateGameState.new(game).call
  %i{ north south east west}.each do |player|
    hand = game_state.hand(player)
    card = hand.first
    PlayCard.new(game, player, card).call
  end
end

Then(/^the south player's hand has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  game_state = CreateGameState.new(game).call
  southern_hand = game_state.hand(:south)
  expect(southern_hand).to have_exactly(9).items
end

Then(/^the south player has a played card$/) do
  game = Game.find(@id)
  game_state = CreateGameState.new(game).call
  expect(game_state.card_played?(:south)).to be true
end

Then(/^the trick is complete$/) do
  game = Game.find(@id)
  game_state = CreateGameState.new(game).call
  expect(game_state).to be_complete_trick
end
