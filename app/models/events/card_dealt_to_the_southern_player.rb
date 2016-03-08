class CardDealtToTheSouthernPlayer < Event
  attr_writer :card

  def self.build(card)
    event = CardDealtToTheSouthernPlayer.new
    event.card = card

    event
  end
end
