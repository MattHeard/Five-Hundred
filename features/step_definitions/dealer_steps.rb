Given(/^there is no dealer$/) do
  game = Game.find(@id)
  dealer = GameState.for(game).dealer
  expect(dealer).to be nil
end

When(/^the dealer is changed$/) do
  game = Game.find(@id)
  ChangeDealer.new(game).call
end
