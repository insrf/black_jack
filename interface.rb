require_relative './human'
require_relative './gamer'
require_relative './diller'
require_relative './bank'
require_relative './deck'
require_relative './score'
require_relative './game'

class Interface
  def initialize
    @game = Game.new
  end

  def submit
    puts "Good afternoon.\nEnter your name"
    @name_gamer = gets.chomp
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
    @game.begin_game(@name_gamer)
    view_cards
    view_scores
    view_bank
    variation
  end

  def next_card
    @game.next_card
    view_cards
    view_scores
    skip_turn
    open_card?
  end

  def skip_turn
    puts 'diller turn...'
    sleep(3) # добавил задержку для того, чтобы "очеловечить" диллера
    @game.skip_turn
    view_cards
    view_scores
    open_card?
  end

  def open_card?
    winner if @game.open_card?
  end

  def winner
    puts "Yours Cards: #{@game.gamer_hand}  ||||| Diller cards #{@game.diller_hand}"
    puts "Yours Scores: #{@game.gamer_scores} ||||| Diller scores #{@game.diller_scores}"
    if @game.gamer_win?
      puts "You win. Congratulations\n________________________"
    elsif @game.diller_win?
      puts "You lose\n________________________"
    else @game.dead_heat?
         puts "dead heat\n________________________"
    end
    view_bank
    @game.reset
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
    puts "Yours Cards: #{@game.gamer_hand}  ||||| Diller cards ***"
  end

  def view_scores
    puts "Yours Scores: #{@game.gamer_scores} ||||| Diller scores ***"
  end

  def view_bank
    puts "Yours cashe #{@game.gamer_bank} |||| Diller cashe #{@game.diller_bank}"
  end
end

interface = Interface.new
interface.submit
