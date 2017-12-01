require_relative './human'
require_relative './gamer'
require_relative './diller'
require_relative './bank'
require_relative './deck'
require_relative './score'
require_relative './game'

class Interface
  def initialize
    @score = Score.new
  end

  def submit
    puts "Good afternoon.\nEnter your name"
    name = gets.chomp
    game = Game.new
    @gamer = Gamer.new(name)
    @diller = Diller.new
    @bank	= Bank.new
    puts "Welcome #{name}"
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
    end
  end

  def begin_game
    @gamer.begin_card
    @diller.begin_card
    @gamer.get_bet
    @diller.get_bet      
    
    puts "Yours cards: #{@gamer.hand}  ||||| Diller cards #{@diller.hand}"
    puts "Yours scores: #{@gamer.score} ||||| Diller scores #{@diller.score}"
    puts "Yours cashe #{@gamer.get_bank} |||| Diller cashe #{@diller.get_bank}"
    variation
  end

  def next_card
    @gamer.give_card
    puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards #{@diller.hand}"
    puts "Yours Scores: #{@gamer.score} ||||| Diller scores #{@diller.score}"
    @diller.give_card if @diller.score < 17
  end

  def skip_turn
    if @diller.score < 17
      @diller.give_card 
      puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards #{@diller.hand}"
    end
  end

  def winner
  	puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards #{@diller.hand}"
  	puts "Yours Scores: #{@gamer.score} ||||| Diller scores #{@diller.score}"
    if @gamer.score > @diller.score && @gamer.score <= 21
      @gamer.win_bank 
      puts "You win. Congratulations"
      puts "________________________"
    elsif @gamer.score < @diller.score && @diller.score <= 21
    	@diller.win_bank
      puts "You lose"
      puts "________________________"
    else @gamer.score == @diller.score
    	puts "dead heat"
    	puts "________________________"
    end
    @gamer.reset_hand
    @diller.reset_hand
    begin_game
  end
end


interface = Interface.new
interface.submit
