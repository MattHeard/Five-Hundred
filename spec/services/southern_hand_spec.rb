require 'rails_helper'

RSpec.describe SouthernHand do
  let(:game) do
    instance_double("Game")
  end

  subject(:service) { SouthernHand.new(game) }
  
  describe "#initialize" do
    it "should take a game and be present" do
      expect(service).to be_present
    end
  end
end
