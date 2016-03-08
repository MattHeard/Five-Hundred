require 'rails_helper'

RSpec.describe CardDealtToTheSouthernPlayer, type: :model do
  let(:card) { "JOKER" }

  subject(:event) { CardDealtToTheSouthernPlayer.new(card) }

  it "is present" do
    expect(:event).to be_present
  end
end
