class Human
  attr_reader :hand

  def initialize(name)
    @hand = []
    @@deck = Deck.new
    @s = Score.new
  end

  def give_card
    @hand << @@deck.get_card
  end

  def score
    @s.hand_score(self.hand)
  end
end