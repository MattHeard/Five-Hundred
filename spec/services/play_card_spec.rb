require 'rails_helper'

RSpec.describe PlayCard do
  describe "#initialize" do
    it "takes three args" do
      arg0 = arg1 = arg2 = nil
      expect { PlayCard.new(arg0, arg1, arg2) }.not_to raise_error
    end
  end
end
