require 'rails_helper'

RSpec.describe CardDealtToTheWesternPlayer, type: :model do
  let(:card) { "JOKER" }

  subject(:event) { CardDealtToTheWesternPlayer.new(card: card) }

  it "should be present" do
    expect(event).to be_present
  end

  describe "#apply" do
    let(:game_state) do
      game_state = instance_double("GameState")
      allow(game_state).to receive(:remove_from_deck)
      allow(game_state).to receive(:add_card_to_hand)
      
      game_state
    end

    it "should return true" do
      expect(event.apply(game_state)).to be true
    end
  end
end
