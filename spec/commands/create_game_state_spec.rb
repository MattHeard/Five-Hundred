require 'rails_helper'

RSpec.describe CreateGameState do
  describe "#call" do
    it "returns a GameState" do
      game = Game.create!
      service = CreateGameState.new(game)
      expect(service.call).to be_an_instance_of GameState
    end
  end
end
