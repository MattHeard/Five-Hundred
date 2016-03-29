require 'rails_helper'

RSpec.describe Deck do
  context "given a new game" do
    describe "#call" do
      subject(:service) { Deck.new(game_state) }

      let(:game) { Game.create! }
      let(:game_state) { CreateGameState.new(game).call }

      it "has 43 items" do
        expect(service.call).to have_exactly(43).items
      end
    end
  end
end
