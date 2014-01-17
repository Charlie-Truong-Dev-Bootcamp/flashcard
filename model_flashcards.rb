# Main file for 
require 'csv'

module Parser
  def parser(file)
    deck = Array.new
    # modified. It was looking for " ". Modified to ""
    raw_data = File.read(file).split("\n").delete_if{|word| word == ""}

    start = 0
    while start < raw_data.length
      definition = raw_data[start]
      answer = raw_data[start+1]
      deck.push(Card.new({definition: definition, answer: answer}))
      start += 2
    end
    deck
  end
end

class Card
  attr_reader :definition, :answer
  def initialize(data={})
    @definition = data[:definition]
    @answer = data[:answer]
  end
end

class Deck
  include Parser
  attr_reader :current_random_card, :deck
  def initialize(file)
    @file = file
    @deck =  parser(file)
    parser(file)
    @current_random_card = nil
  end

  def retrieve_random_card
   @current_random_card = @deck.sample
  end

  def correct_answer?(string) #name pending
    @current_random_card.answer.downcase == string.downcase
  end
end

# deck = Deck.new('flashcard_samples.txt')
# p deck.deck
