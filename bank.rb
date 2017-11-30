class Bank
  attr_accessor :cashe
  
  def initialize(cache = 100)
    @cashe = cashe
  end

  def bet
    @cashe -= 10
  end

end