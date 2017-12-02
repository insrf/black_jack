require_relative './human'
require_relative './gamer'
require_relative './diller'
require_relative './bank'
require_relative './deck'
require_relative './score'

class Interface
  def initialize
    @score = Score.new
  end

  def submit
    puts "Good afternoon.\nEnter your name"
    @name_gamer = gets.chomp
    @bank	= Bank.new
    puts "Welcome #{@name_gamer}"
    begin_game
  end

  def variation
    loop do
      puts "1. Take a card?\n2. Skip turn \n3. Show cards"
      variant = gets.chomp.to_i
      case variant
      when 1
        next_card
      when 2
        skip_turn
      when 3
        winner
      end
      break if @variant2 == 0
    end
  end

  def begin_game
    @gamer = Gamer.new(@name_gamer)
    @diller = Diller.new
    @gamer.begin_card
    @diller.begin_card
    @gamer.get_bet
    @diller.get_bet

    view_cards
    view_scores
    view_bank
    variation
  end

  def next_card
    if @gamer.hand.size < 3
      @gamer.give_card
    else
      puts 'You have 3 cards'
    end
    view_cards
    view_scores
    skip_turn
  end

  def skip_turn
    puts 'diller turn...'
    sleep(3) # добавил задержку для того, чтобы "очеловечить" диллера
    if @diller.score < 17 && @diller.hand.size < 3
      @diller.give_card
    else
      puts 'diller skip'
      sleep(2)
    end
    view_cards
    view_scores
    open_card?
  end

  def open_card?
    winner if @diller.hand.size == 3 && @gamer.hand.size == 3
  end

  def winner
    puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards #{@diller.hand}"
    puts "Yours Scores: #{@gamer.score} ||||| Diller scores #{@diller.score}"
    if @gamer.score > @diller.score && @gamer.score <= 21
      @gamer.win_bank
      puts "You win. Congratulations\n________________________"
    elsif @gamer.score < @diller.score || @gamer.score > 21
      @diller.win_bank
      puts "You lose\n________________________"
    else @gamer.score == @diller.score
      puts "dead heat\n________________________"
    end
    view_bank
    @gamer.reset_hand
    @diller.reset_hand
    continue_game?
  end

  def continue_game?
    puts '1. New game? 0. End game'
    @variant2 = gets.chomp.to_i
    case @variant2
    when 1
      begin_game
      variation
    when 0
      puts 'Buy'
    end
  end

  def view_cards
    puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards ***"
  end

  def view_scores
    puts "Yours Scores: #{@gamer.score} ||||| Diller scores ***"
  end

  def view_bank
    puts "Yours cashe #{@gamer.get_bank} |||| Diller cashe #{@diller.get_bank}"
  end
end

interface = Interface.new
interface.submit
