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
    @gamer.give_card
    @gamer.give_card
    @diller.give_card
    @diller.give_card      
    
    puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards **"
    puts "Yours Scores: #{@gamer.score}"
    variation
  end

  def next_card
    @gamer.give_card
    puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards **"
    puts "Yours Scores: #{@gamer.score}"
    @diller.give_card if @diller.score < 17
  end

  def skip_turn
    if @diller.score < 17
      @diller.give_card 
      puts "Yours Cards: #{@gamer.hand}  ||||| Diller cards ***"
    end
  end

  def winner
    if @gamer.score <= 21 
      puts "You win. Congratulations"
    elsif @gamer.score > 21
      puts "You lose"
    end
    begin_game
  end
end


interface = Interface.new
interface.submit
