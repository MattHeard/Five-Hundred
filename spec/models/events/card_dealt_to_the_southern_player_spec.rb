require 'rails_helper'

RSpec.describe CardDealtToTheSouthernPlayer, type: :model do
  let(:card) { "JOKER" }

  subject(:event) { CardDealtToTheSouthernPlayer.new(card: card) }

  it "should be present" do
    expect(event).to be_present
  end

  describe "#apply" do
    let(:game_state) do
      game_state = instance_double("GameState")
      allow(game_state).to receive(:remove_from_deck)
      
      game_state
    end

    it "should return true" do
      expect(event.apply(game_state)).to be true
    end
  end
end
