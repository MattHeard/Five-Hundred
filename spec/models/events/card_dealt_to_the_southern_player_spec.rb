require 'rails_helper'

RSpec.describe CardDealtToTheSouthernPlayer, type: :model do
  let(:card) { "JOKER" }

  subject(:event) { CardDealtToTheSouthernPlayer.build(card) }

  it "should be present" do
    expect(event).to be_present
  end
end
