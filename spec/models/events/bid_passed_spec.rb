require 'rails_helper'

RSpec.describe BidPassed do
  subject(:event) { BidPassed.create!(target_player: bidder, game: game) }

  let(:bidder) { :south }
  let(:game) { Game.create! }
  let(:game_state) do
    game_state = GameState.new
    game_state.bidder = bidder
    
    game_state
  end

  before { event.apply(game_state) }

  describe "#apply" do
    it "changes the bidder to :west" do
      expect(game_state.bidder).to be :west
    end

    it "does not add any bids" do
      expect(game_state.bids).to be_empty
    end
  end
end
