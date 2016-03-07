Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end

When(/^a card is dealt to the southern player$/) do
  game = Game.find(@id)
  DealCardToTheSouthernPlayer.new(game).call
end
