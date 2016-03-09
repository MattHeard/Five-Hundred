require 'rails_helper'

RSpec.describe GameState do
  subject(:game_state) { GameState.new }

  describe "#deck" do
    it "should have a size" do
      expect(game_state.deck).to respond_to(:size)
    end
  end
end
