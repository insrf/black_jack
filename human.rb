class Human
  attr_reader :hand, :deck

  def initialize(name, deck)
    @deck = deck
    @bank = Bank.new
    @score = Score.new
  end

  def begin_card
    @hand = []
    @hand << @deck.get_card << @deck.get_card
  end

  def give_card
    @hand << @deck.get_card
  end

  def get_bet
    @bank.bet
  end

  def get_bank
    @bank.cashe
  end

  def win_bank
    @bank.win_bet
  end

  def reset_hand
    @hand = []
  end

  def score
    @score.hand_score(hand)
  end
end
