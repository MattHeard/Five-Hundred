require 'rails_helper'

RSpec.describe CardPlayed do
  describe "#apply" do
    subject(:event) { CardPlayed.new }

    it "does not raise an error when called" do
      expect { event.apply }.to_not raise_error
    end
  end
end
