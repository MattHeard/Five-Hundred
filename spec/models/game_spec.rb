require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { Game.create }

  context "with no modifications" do
    it "has no events" do
      expect(game.events).to be_empty
    end
  end
end
