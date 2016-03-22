require 'rails_helper'

RSpec.describe PlayCard do
  let(:service) { PlayCard.new(nil, nil, nil) }

  describe "#initialize" do
    it "takes three args" do
      expect { service }.not_to raise_error
    end
  end

  describe "#call" do
    it "can be called" do
      expect { service.call }.not_to raise_error
    end
  end
end
