require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { GameState.new }

  context "with no modifications" do
    describe "#deck" do
      it "should have 43 cards" do
        expect(game_state.deck).to have_exactly(43).items
      end
    end

    describe "#kitty" do
      it "should be empty" do
        expect(game_state.kitty).to be_empty
      end
    end

    describe "#dealer" do
      it "should be nil" do
        expect(game_state.dealer).to be nil
      end
    end
  end
end
