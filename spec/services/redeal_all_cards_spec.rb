require 'rails_helper'

RSpec.describe RedealAllCards do
  describe "#initialize" do
    it "should be present" do
      arg = 0
      expect(RedealAllCards.new(arg)).to be_present
    end
  end
end
