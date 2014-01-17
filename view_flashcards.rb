class CardView
  attr_reader :card

  def initialize(card)
    @card = card
  end

  def display_definition
    puts "#{@card.definition_only}"
  end

  def prompt_user
    puts "Make a guess"
  end

  def try_again
    puts "Try again!"
  end

  def correct
    puts "Correct!\n"
  end
end
