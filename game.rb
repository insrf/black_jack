class Game
  def initialize
    @bank = Bank.new
    @deck = Deck.new
  end

  def begin_game(_name_gamer)
    @gamer = Gamer.new(@name_gamer, @deck)
    @diller = Diller.new(@deck)
    @gamer.begin_card
    @diller.begin_card
    @gamer.get_bet
    @diller.get_bet
  end

  def next_card
    @gamer.give_card if @gamer.hand.size < 3
  end

  def skip_turn
    @diller.give_card if @diller.score < 17 && @diller.hand.size < 3
  end

  def open_card?
    @diller.hand.size == 3 && @gamer.hand.size == 3
  end

  def gamer_win?
    @gamer.win_bank if @gamer.score > @diller.score && @gamer.score <= 21
  end

  def diller_win?
    @diller.win_bank if @gamer.score < @diller.score || @gamer.score > 21
  end

  def dead_heat?
    @gamer.score == @diller.score
  end

  def reset
    @gamer.reset_hand
    @diller.reset_hand
  end

  def gamer_hand
    @gamer.hand
  end

  def diller_hand
    @diller.hand
  end

  def gamer_scores
    @gamer.score
  end

  def diller_scores
    @diller.score
  end

  def gamer_bank
    @gamer.get_bank
  end

  def diller_bank
    @diller.get_bank
  end
end
