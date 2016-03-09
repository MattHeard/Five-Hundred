Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end

When(/^a(?:nother)? card is dealt to the southern player$/) do
  game = Game.find(@id)
  DealCardToTheSouthernPlayer.new(game).call
end

When(/^a card is dealt to the western player$/) do
  game = Game.find(@id)
  DealCardToTheWesternPlayer.new(game).call
end

Then(/^the deck has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  deck = GameState.for(game).deck
  expect(deck).to have_exactly(number_of_cards.to_i).items
end

Then(/^the southern player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  southern_hand = GameState.for(game).hands[:south]
  expect(southern_hand).to have_exactly(number_of_cards.to_i).items
end

Then(/^the western player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  western_hand = GameState.for(game).hands[:west]
  expect(western_hand).to have_exactly(number_of_cards.to_i).items
end
