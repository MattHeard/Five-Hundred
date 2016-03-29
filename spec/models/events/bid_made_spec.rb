require 'pp'
require 'rails_helper'

# TODO Investigate time travel
RSpec.describe BidMade do
  subject(:event) do
    BidMade.create!(player_seat: bidder_seat,
                    number_of_tricks: number_of_tricks,
                    trump_suit: trump_suit,
                    game: game)
  end

  let(:bidder_seat) { :south }
  let(:game) { Game.create! }
  let(:game_state) do
    game_state = GameState.new
    game_state.current_player_seat = bidder_seat

    game_state
  end

  before { event.apply(game_state) }

  context "with a bid of 6 Spades" do
    let(:number_of_tricks) { 6 }
    let(:trump_suit) { "♠" }

    describe "#apply" do
      it "changes the bidder to :west" do
        expect(game_state.current_player_seat).to be :west
      end

      it "adds a bid" do
        expect(game_state.bid_count).not_to eq 0
      end

      it "sets the bid to 6 Spades" do
        expect(game_state.highest_bid.number_of_tricks).to eq 6
        expect(game_state.highest_bid.trump_suit).to eq "♠"
      end
    end
  end
end
