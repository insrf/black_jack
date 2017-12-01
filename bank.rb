class Bank
  attr_reader :cashe
  
  def initialize(cashe = 100)
    @cashe = cashe
  end

  def bet
    @cashe -= 10
  end

  def win_bet
  	@cashe += 20
  end
end