Given(/^there is no dealer$/) do
  game = Game.find(@id)
  dealer_seat = CreateGameState.new(game).call.dealer_seat
  expect(dealer_seat).to be nil
end

When(/^the dealer is changed$/) do
  game = Game.find(@id)
  ChangeDealer.new(game).call
end

Then(/^there will be a dealer$/) do
  game = Game.find(@id)
  dealer_seat = CreateGameState.new(game).call.dealer_seat
  expect(dealer_seat).not_to be nil
end

Given(/^the dealer is chosen$/) do
  game = Game.find(@id)
  ChangeDealer.new(game).call
end
