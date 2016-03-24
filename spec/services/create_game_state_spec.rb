require 'rails_helper'

RSpec.describe CreateGameState do
  describe "#call" do
    it "returns a GameState" do
      game = Game.create!
      expect(CreateGameState.new(game).call).to be_present
    end
  end
end
