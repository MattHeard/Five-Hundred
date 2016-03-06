Given(/^I start a new game$/) do
  @game = Game.create
end

Then(/^the deck will have (\d+) cards$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the deck will be shuffled$/) do
  expect(@game.deck.join).not_to eq Game::UNSHUFFLED_DECK.join
end
