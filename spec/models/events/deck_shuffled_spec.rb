require 'rails_helper'

RSpec.describe DeckShuffled, type: :model do
  context "as a new event" do
    subject(:event) { DeckShuffled.new }

    it "should have no associated game" do
      expect(event.game).to be nil
    end

    it "should have no state_attribute" do
      expect(event.state_attribute).to be nil
    end

    it "should have no encoded value" do
      expect(event.encoded_value).to be nil
    end

    it "should have an empty array for a value" do
      expect(event.value).to be_empty
    end
  end
end
