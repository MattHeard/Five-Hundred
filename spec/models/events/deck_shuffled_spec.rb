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

  context "built from the factory" do
    subject(:event) { DeckShuffled.build }

    it "should have no associated game" do
      expect(event.game).to be nil
    end

    it "should modify the deck" do
      expect(event.state_attribute).to eq "deck="
    end

    it "should have an encoded value" do
      expect(event.encoded_value).to be_present
    end

    it "should have an array which is not empty for its value" do
      expect(event.value).not_to be_empty
    end

    it "should have not have an unshuffled deck for its value" do
      expect(event.value.join).not_to eq Game::UNSHUFFLED_DECK.join
    end
  end
end
