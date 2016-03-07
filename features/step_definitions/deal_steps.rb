Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end

When(/^a card is dealt to the southern player$/) do
  game = Game.find(@id)
  DealCardToTheSouthernPlayer.new(game).call
end

Then(/^the deck has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  deck = Deck.new(game).call
  expect(deck).to have_exactly(number_of_cards.to_i).items
end
