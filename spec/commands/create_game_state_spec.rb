require 'rails_helper'

# LINE | MESSAGE | ORIGIN   | TYPE  | TEST
# =====|=========|==========|=======|===============
# 6    | call    | incoming | query | assert result

RSpec.describe CreateGameState do

  # TODO Find out what kinds of game event lists I should unit test
  describe "#call" do
    context "for a game with no events" do
      it "returns a GameState" do
        game = Game.create!
        service = CreateGameState.new(game)
        expect(service.call).to be_an_instance_of GameState
      end
    end
  end
end
