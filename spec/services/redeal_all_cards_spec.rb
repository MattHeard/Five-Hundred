require 'rails_helper'

RSpec.describe RedealAllCards do
  describe "#initialize" do
    subject(:service) { RedealAllCards.new(arg) }

    let(:arg) { 0 }

    it "should be present" do
      expect(service).to be_present
    end
  end
end
