Given(/^there is no dealer$/) do
  game = Game.find(@id)
  dealer = GameState.for(game).dealer
  expect(dealer).to be nil
end
