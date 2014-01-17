require_relative 'view_flashcards'
require_relative 'model_flashcards'

class Controller
  
  def initialize(filename)
    @deck = Deck.from_file(filename)
    @current_card = nil  
    @cardview = CardView.new
  end

  def play    
    show_new_card
    input = String.new
    

    while input != 'quit' && @deck.has_cards?
      input = gets.chomp
      case current_card.correct_answer?(input)
        when true                         
          correct
          show_new_card
        else
          try_again
          show_same_card
      end
    end

    win
    goodbye
  end



  def draw_random_card
    self.current_card = deck.retrieve_random_card
  end

  def show_new_card
    draw_random_card
    cardview.display_definition(@current_card)
  end

  def show_same_card
    cardview.display_definition(@current_card)
  end

  private
  attr_reader :cardview, :deck
  attr_accessor :current_card

  def try_again
    puts "\n\nTry again!\n"
  end

  def correct
    puts "\n\nCorrect!\n"
  end

  def goodbye
    puts "\n\nThanks for playing SCJJ's Fantastic Flashcards Fiasco! Goodbye!"
  end

  def win
    puts "\n\nYou are a rock star!"
  end
end

c = Controller.new("alternative_deck.txt")
c.play


