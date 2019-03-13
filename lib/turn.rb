# TURN CLASS

class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess.to_s
    @card = card
  end

  def feedback
    if @guess == "q" || @guess == "!!!"
      "Goodbye!"
    elsif @guess == @card.answer
      "Correct!"
    else
      "Try again:"
    end
  end

end

# INTERACTION PATTERN
#
# pry(main)> require './lib/turn'
# #=> true
#
# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
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

# pry(main)> card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
# #=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>

# pry(main)> turn = Turn.new("Saturn", card)
# #=> #<Turn:0x00007f998413ee60 @card=#<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>, @guess="Saturn">
#
# pry(main)> turn.card
# => #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>
#
# pry(main)> turn.guess
# => "Saturn"
#
# pry(main)> turn.correct?
# => false
#
# pry(main)> turn.feedback
# => "Incorrect."
