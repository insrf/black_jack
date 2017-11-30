load 'interface.rb'
s = Score.new
g = Gamer.new
g.give_card
d = Diller.new
d.give_card
s.card_score(d.hand)


g.give_begin_card
g.give_score

#d.get_random
load 'deck.rb'
d = Deck.new
d.get_random

load 'score.rb'
s = Score.new
s.hand_score("T♥", "T♥", "T♥")


s.hand("3♥", "3♥", "2♥")

s.hand_score("3♥", "3♥", "2♥")



s.card_score("T♥")