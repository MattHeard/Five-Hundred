require 'rails_helper'

RSpec.describe DealerChanged do
  subject(:event) { DealerChanged.create!(target_player: player, game: game) }

  let(:game) { Game.create! }
  let(:game_state) { GameState.new }

  before { event.apply(game_state) }

  describe "#apply" do
    context "making the southern player the dealer" do
      let(:player) { :south }

      it "makes the southern player the dealer" do
        expect(game_state.dealer).to eq :south
      end
    end
  end
end