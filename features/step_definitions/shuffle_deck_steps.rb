Given(/^I start a new game$/) do
  @game = Game.create
  @deck = @game.deck
end

When(/^I reload the game$/) do
  id = @game.id
  @game = Game.find(id)
end

Then(/^the deck has (\d+) cards$/) do |number_of_cards|
  expect(@game.deck.size).to eq number_of_cards.to_i
end

Then(/^the deck is shuffled$/) do
  expect(@game.deck.join).not_to eq Game::UNSHUFFLED_DECK.join
end

Then(/^the deck order is unchanged$/) do
  expect(@game.deck.join).to eq @deck.join
end
