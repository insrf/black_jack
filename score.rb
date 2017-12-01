class Score
  attr_reader :sum

  def card_score(card) # подсчет очков одной карты
    score_one_card = 0
    case card[0]
    when 'T'
      score_one_card = 11
    when 'J', 'Q', 'K'
      score_one_card = 10
    when '1' # первый символ десятки
      score_one_card = 10
    when ('2'..'9')
      score_one_card = card[0].to_i
    else puts 'No card'
    end
  end

  def hand_score(card_arr) # подсчет очков карт на руке
    sum = 0
    card_arr.each do |item|
      sum += card_score(item)
    end
    card_arr.each do |item|
      sum -= 10 if (sum > 21) && item[0].include?('T')
    end
    sum
  end
end
