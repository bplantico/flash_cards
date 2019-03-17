class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select do |card|
        card.category == category
    end
  end

end


# A Deck is initialized with an array of Card objects.
# A Deck should also be able to return cards based on a given category.
# The Deck class should respond to the following interaction pattern:
#
# pry(main)> cards = [card_1, card_2, card_3]
#
# pry(main)> deck = Deck.new(cards)
# => #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> deck.cards
# #=> [#<Card:0x00007fa16104e160...>, #<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.count
# #=> 3
#
# pry(main)> deck.cards_in_category(:STEM)
# #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.cards_in_category(:Geography)
# #=> [#<Card:0x00007fa16104e160...>]
#
# pry(main)> deck.cards_in_category("Pop Culture")
# #=> []
