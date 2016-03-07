require 'rails_helper'

RSpec.describe DealCardToTheSouthernPlayer do
  describe "#initialize" do
    let(:game) { instance_double("Game") }

    subject(:service) { DealCardToTheSouthernPlayer.new(game) }

    it "should take a game and to be present" do
      expect(:service).to be_present
    end
  end
end
