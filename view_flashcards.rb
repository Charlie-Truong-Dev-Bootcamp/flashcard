class CardView
  attr_reader :card

  def initialize(card)
    @card = card
  end

  def display_definition
    puts definition
  end

  def definition
    <<-STRING


#{@card.definition}


Answer:
STRING
  end

  def set_card(card)
    @card = card
  end
end
