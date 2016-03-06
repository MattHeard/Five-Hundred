require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#deck" do
    subject(:game) { Game.create }

    it "not to be nil" do
      expect(game.deck).not_to be nil
    end
  end
end
