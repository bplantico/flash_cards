
class Round
  attr_reader :deck,
              :turns,
              :card_index,
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_index = 0
    @current_card = deck.cards[@card_index]
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @card_index += 1
    @current_card  = deck.cards[@card_index]

    turn
  end

  def number_correct
    card_counter = 0
    @turns.each do |turn|
      if turn.correct?
        card_counter += 1
      end
    end
    card_counter
  end
end

# A Round will be the object that processes responses and records guesses.
# When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.
# The take_turn method takes a string representing the guess.
# It should create a new Turn object with the appropriate guess and Card.
# It should store this new Turn, as well as return it from the take_turn method.
# Also, when the take_turn method is called, the Round should move on to the next card in the deck.
