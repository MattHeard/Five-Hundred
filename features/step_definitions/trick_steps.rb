When(/^the south player plays a card$/) do
  game = Game.find(@id)
  player = :south
  game_state = GameState.for(game)
  southern_hand = game_state.hands[player]
  card = southern_hand.first
  PlayCard.new(game, player, card).call
end

Then(/^the south player's hand has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  game_state = GameState.for(game)
  southern_hand = game_state.hands[:south]
  expect(southern_hand).to have_exactly(9).items
end

Then(/^the south player has a played card$/) do
  game = Game.find(@id)
  game_state = GameState.for(game)
  expect(game_state.card_played?(:south)).to be true
end
