class Deck
  attr_reader :deck
  def initialize
    @deck = ['A♥', '2♥', '3♥', '4♥', '5♥', '6♥', '7♥', '8♥', '9♥', '10♥', '11♥', 'J♥', 'Q♥', 'K♥',
             'A♦', '2♦', '3♦', '4♦', '5♦', '6♦', '7♦', '8♦', '9♦', '10♦', '11♦', 'J♦', 'Q♦', 'K♦',
             'A♣', '2♣', '3♣', '4♣', '5♣', '6♣', '7♣', '8♣', '9♣', '10♣', '11♣', 'J♣', 'Q♣', 'K♣',
             'A♠', '2♠', '3♠', '4♠', '5♠', '6♠', '7♠', '8♠', '9♠', '10♠', '11♠', 'J♠', 'Q♠', 'K♠']
  end

  def get_card
    rand_card = @deck[rand(@deck.size)]
    @deck.delete(rand_card)
  end
end
