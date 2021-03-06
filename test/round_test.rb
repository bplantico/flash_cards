require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class RoundTest < Minitest::Test

  def test_Round_class_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_deck_exists_in_Round_class
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_turns_method_initializes_blank_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_current_card_method_return
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck   = Deck.new([card_1, card_2, card_3])
    round  = Round.new(deck)

    assert_equal card_1, round.current_card
    #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
  end

  def test_take_turn_method_creates_an_instance_of_turn_class
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_return_true_when_guess_is_correct
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    # Below, new_turn is a Turn class object created by calling the .take_turn method on round.
    # round is a Round class object.
    # In this test, "Juneau" is being passed into the .take_turn method as the guess.
    # A guess is an attribute initialized with Turn class objects.
    new_turn = round.take_turn("Juneau")

    # since new_turn is a turn class object, calling the .correct? method is possible.
    assert new_turn.correct?
  end

  def test_return_true_when_guess_is_incorrect
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Denver")

    refute new_turn.correct?
  end

  def test_take_turn_adds_turn_class_object_to_turns_array
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Denver")

    assert_equal [new_turn], round.turns
  end

  def test_number_correct_is_counted
    card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck     = Deck.new([card_1, card_2, card_3])
    round    = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_number_correct_not_counted_when_guess_incorrect
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    new_turn    = round.take_turn("Denver")

    assert_equal 0, round.number_correct
  end

  def test_current_card_advances_when_take_turn_method_called
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)

    assert_equal card_1, round.current_card
    new_turn    = round.take_turn("Denver")
    assert_equal card_2, round.current_card
  end

  def test_turn_count_when_multiple_turns
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 2, round.turns.count
  end

  def test_feedback_when_last_turn_guess_incorrect
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_feedback_when_first_turn_guess_correct_and_second_turn_guess_incorrect
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)

    turn_1      = round.take_turn("Juneau")
    assert_equal "Correct!", round.turns.last.feedback
    turn_2      = round.take_turn("Venus")
    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_feedback_when_first_turn_guess_correct_and_second_turn_guess_correct
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)

    turn_1      = round.take_turn("Juneau")
    assert_equal "Correct!", round.turns.last.feedback
    turn_2      = round.take_turn("Mars")
    assert_equal "Correct!", round.turns.last.feedback
  end

  def test_number_correct_with_multiple_turns
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 1, round.number_correct
  end

  def test_number_correct_with_multiple_turns_again
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Mars")

    assert_equal 2, round.number_correct
  end

  def test_number_correct_with_multiple_turns_triple_check
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Mars")
    turn_3      = round.take_turn("North")

    assert_equal 2, round.number_correct
  end

  def test_number_correct_by_category_with_multiple_turns
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_with_multiple_turns_and_different_category
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_percent_correct_method
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct
  end

  def test_percent_correct_by_category_method
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)
    turn_1      = round.take_turn("Juneau")
    turn_2      = round.take_turn("Venus")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_current_card_advances_when_take_turn_method_called_again
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)

    assert_equal card_1, round.current_card
    turn_1      = round.take_turn("Juneau")
    assert_equal card_2, round.current_card
    turn_2      = round.take_turn("Venus")
    assert_equal card_3, round.current_card
  end

  def test_current_card_nil_when_take_turn_method_called_and_no_cards_left_in_deck
    card_1      = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2      = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3      = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck        = Deck.new([card_1, card_2, card_3])
    round       = Round.new(deck)

    assert_equal card_1, round.current_card
    turn_1      = round.take_turn("Juneau")
    assert_equal card_2, round.current_card
    turn_2      = round.take_turn("Mars")
    assert_equal card_3, round.current_card
    turn_3      = round.take_turn("North north west")

    assert_nil round.current_card
  end
end
