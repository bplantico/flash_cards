
class Round
  attr_reader :deck,
              :turns,
              :card_index,
              :current_car

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

  def number_correct # refactored instead of .each method
    correct_turn_counter = @turns.select do |turn|
      turn.correct?
    end
    correct_turn_counter.count
  end

  def number_correct_by_category(category)
    correct_turns = @turns.select do |turn|
      turn.correct? == true && category == turn.card.category
    end
    correct_turns.count
  end

  def percent_correct
    (number_correct.to_f / turns.count) * 100
  end

  def percent_correct_by_category(category)
    all_turns_in_category = @turns.select do |turn|
      category == turn.card.category
    end
    (number_correct_by_category(category) / (all_turns_in_category.count).to_f * 100)
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    while @current_card != nil
      deck.count.times do
        puts "This is card number #{@card_index + 1} of #{deck.count}"
        puts "#{@current_card.question}"
        take_turn(gets.chomp)
        puts "#{@turns.last.feedback}"
      end
    end

    puts "****** Game over! ******"
    # create an array that is only the categories
      categories = deck.cards.map do |card|
        card.category
      end
    # return only unique objects from array
      unique_categories = categories.uniq
    # put the percent_correct_by_category
    unique_categories.each do |cat|
      puts "#{cat} - #{percent_correct_by_category(cat)}%"
    end
  end
end
