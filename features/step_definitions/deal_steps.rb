Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end

When(/^a(?:nother)? card is dealt to the southern player$/) do
  game = Game.find(@id)
  DealCardToTheSouthernPlayer.new(game).call
end

Then(/^the deck has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  deck = Deck.new(game).call
  expect(deck).to have_exactly(number_of_cards.to_i).items
end

Then(/^the southern player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  southern_hand = SouthernHand.new(game).call
  expect(southern_hand).to have_exactly(number_of_cards.to_i).items
end

Then(/^the western player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  western_hand = WesternHand.new(game).call
  expect(western_hand).to have_exactly(number_of_cards.to_i).items
end
