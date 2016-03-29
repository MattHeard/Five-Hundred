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
  game_state = CreateGameState.new(game).call
  deck = Deck.new(game_state).call
  expect(deck).to have_exactly(number_of_cards.to_i).items
end

Then(/^the southern player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  southern_hand = CreateGameState.new(game).call.hand(:south)
  expect(southern_hand).to have_exactly(number_of_cards.to_i).items
end

Then(/^the western player's hand has (\d+) cards?$/) do |number_of_cards|
  game = Game.find(@id)
  western_hand = CreateGameState.new(game).call.hand(:west)
  expect(western_hand).to have_exactly(number_of_cards.to_i).items
end

Given(/^the players each have (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  %i{north south east west}.each do |player|
    hand = CreateGameState.new(game).call.hand(player)
    expect(hand).to have_exactly(number_of_cards.to_i).items
  end
end

Given(/^the kitty has (\d+) cards$/) do |number_of_cards|
  game = Game.find(@id)
  kitty = CreateGameState.new(game).call.kitty
  expect(kitty).to have_exactly(number_of_cards.to_i).items
end

When(/^all the cards are dealt$/) do
  game = Game.find(@id)
  DealAllCards.new(game).call
end

Given(/^the south player has cards in their hand$/) do
  game = Game.find(@id)
  @south_hand = CreateGameState.new(game).call.hand(:south)
  expect(@south_hand).not_to be_empty
end

Then(/^the south player's hand has changed$/) do
  original_south_hand = @south_hand
  game = Game.find(@id)
  @south_hand = CreateGameState.new(game).call.hand(:south)
  expect(@south_hand.join(" ")).not_to eq original_south_hand.join(" ")
end
