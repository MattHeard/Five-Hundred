require 'rails_helper'

RSpec.describe BidPassed do
  subject(:event) { BidPassed.create!(player_seat: bidder_seat, game: game) }

  let(:bidder_seat) { :south }
  let(:game) { Game.create! }
  let(:game_state) do
    game_state = GameState.new
    game_state.current_player_seat = bidder_seat

    game_state
  end

  before { event.apply(game_state) }

  describe "#apply" do
    it "changes the bidder to :west" do
      expect(game_state.current_player_seat).to be :west
    end

    it "does not add any bids" do
      expect(game_state.bid_count).to eq 0
    end
  end
end
