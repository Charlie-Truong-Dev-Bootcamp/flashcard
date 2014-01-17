require_relative 'view_flashcards'
require_relative 'model_flashcards'

class Controller
  
  def initialize(filename)
    @deck = Deck.new(filename)
    @current_card = @deck.retrieve_random_card  
    @cardview = CardView.new(@current_card)
  end

  def play    
    cardview.display_definition
    input = gets.chomp

    case 
    when input == 'quit'
      goodbye
      return
    when deck.correct_answer?(input)                        
      correct
      draw_random_card
      cardview.set_card(@current_card)
      play
    else
      try_again
      play
    end
  end

  def draw_random_card
    self.current_card = deck.retrieve_random_card
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
end





c = Controller.new("flashcard_samples.txt")
c.play


