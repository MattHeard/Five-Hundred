Given(/^a new game has been started$/) do
  game = Game.create
  @id = game.id
end
