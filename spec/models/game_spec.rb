require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#deck" do
    subject(:game) { Game.create }

    it "should be defined" do
      expect(game).to respond_to(:deck)
    end

    it "not to be nil" do
      expect(game.deck).not_to be nil
    end

    it "should respond to :join" do
      expect(game.deck).to respond_to(:join)
    end

    it "should have 43 cards" do
      expect(game.deck).to have_exactly(43).items
    end
  end
end
