require 'rails_helper'

RSpec.describe Deck do
  let(:game) { instance_double("Game") }

  subject(:service) { Deck.new(game) }

  describe "#initialize" do
    it "should take a game and be present" do
      expect(service).to be_present
    end
  end
end
