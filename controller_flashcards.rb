require_relative 'view_flashcards'
require_relative 'model_flashcards'

class Controller
  attr_reader :user_input
  def initialize(filename)

    @deck = Deck.new(filename)
    @current_card = @deck.current_random_card
    @current_card = @deck.retrieve_random_card
    @user_input = ""   
  end

  # new card definition


  def play
    
    card_view = CardView.new(@current_card)
    card_view.display_definition
    # card_view.prompt_user
    get_user_input

    case @deck.correct_answer?(@user_input)
    when true                        
      card_view.correct          #@deck.right?(@user_input)
      @current_card = @deck.retrieve_random_card
      play
    when false
      card_view.try_again
      play
    end
  end

  def get_user_input
    @user_input = gets.chomp
  end
end

# class Card
#   attr_reader :definition, :answer
#   def initialize
#     @definition = "The language we are learning."
#     @answer = "Ruby"
#   end

# end



c = Controller.new("flashcard_samples.txt")
c.play


