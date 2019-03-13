# TURN CLASS

class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end

# INTERACTION PATTERN
#
# pry(main)> turn = Turn.new("Juneau", card)
# #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @guess="Juneau">
#
# pry(main)> turn.card
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
#
# pry(main)> turn.guess
# #=> "Juneau"
#
# pry(main)> turn.correct?
# #=> true
#
# pry(main)> turn.feedback
# #=> "Correct!"
#
# pry(main)> turn.correct?
# => false
#
# pry(main)> turn.feedback
# => "Incorrect."
