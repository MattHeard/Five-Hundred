require 'rails_helper'

RSpec.describe Deck do
  subject(:service) { Deck.new }

  describe "#initialize" do
    it "should be present" do
      expect(service).to be_present
    end
  end
end
