Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end

Given(/^a new game has been set up$/) do
  game = Game.create
  @id = game.id
  DealAllCards.new(game).call
  ChangeDealer.new(game).call
end

When(/^a(?:nother)? card is dealt to the southern player$/) do
  game = Game.find(@id)
  player = :south
  DealCard.new(game, player).call
end

When(/^a card is dealt to the western player$/) do
  game = Game.find(@id)
  player = :west
  DealCard.new(game, player).call
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

Given(/^the players each have (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  hands = GameState.for(game).hands
  %i{north south east west}.each do |player|
    expect(hands[player]).to have_exactly(number_of_cards.to_i).items
  end
end

Given(/^the kitty has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  kitty = GameState.for(game).kitty
  expect(kitty).to have_exactly(number_of_cards.to_i).items
end

When(/^all the cards are dealt$/) do
  game = Game.find(@id)
  DealAllCards.new(game).call
end

Given(/^the south player has cards in their hand$/) do
  game = Game.find(@id)
  @south_hand = GameState.for(game).hands[:south]
  expect(@south_hand).not_to be_empty
end

Then(/^the south player's hand has changed$/) do
  original_south_hand = @south_hand
  game = Game.find(@id)
  @south_hand = GameState.for(game).hands[:south]
  expect(@south_hand.join(" ")).not_to eq original_south_hand.join(" ")
end
