require 'minitest/autorun'
require 'minitest/emoji'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  # def test_card_exists
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   assert_instance_of Card, card
  # end
  #
  #
  # def test_turn_exists
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("Juneau", card)
  #
  #   assert_instance_of Turn, turn
  # end
  #
  #
  # def test_Turn_class_object_includes_Card_class_object
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("guess", card)
  #
  #   assert_same card, turn.card
  # end
  #
  #
  # def test_turn_has_a_guess
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("guess", card)
  #
  #   assert_equal "guess", turn.guess
  # end
  #
  #
  # def test_if_guess_is_correct?
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("Juneau", card)
  #
  #   assert_equal turn.guess, card.answer
  # end
  #
  #
  # def test_feedback_if_guess_is_correct
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   turn = Turn.new("Juneau", card)
  #
  #   assert_includes "Correct!", turn.feedback
  # end
  #

  def test_card_exists
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_instance_of Card, card
  end



  def test_turn_exists
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
  end


  def test_Turn_class_object_includes_Card_class_object
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_same card, turn.card
  end


  def test_turn_has_a_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end


  def test_if_guess_is_correct?
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute_equal turn.guess, card.answer
  end


  def test_feedback_if_guess_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_includes "Try again:", turn.feedback
  end

end
