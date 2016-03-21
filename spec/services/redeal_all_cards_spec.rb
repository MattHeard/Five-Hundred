require 'rails_helper'

RSpec.describe RedealAllCards do
  subject(:service) { RedealAllCards.new(arg) }

  let(:arg) { 0 }

  describe "#initialize" do
    it "should be present" do
      expect(service).to be_present
    end
  end

  describe "#call" do
    it "should be nil" do
      expect(service.call).to be nil
    end
  end
end
