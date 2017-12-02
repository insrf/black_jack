class Gamer < Human
  attr_reader :name
  def initialize(name, deck)
    super
    @name = name
  end
end
