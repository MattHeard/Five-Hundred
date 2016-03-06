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
  end
end
