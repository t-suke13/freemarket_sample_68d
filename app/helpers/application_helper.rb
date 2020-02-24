module ApplicationHelper
  #viewのselect_tagに使用。CardsHelperではうまく読み込めなかったので、ApplicationHelperに記述。
  def card_month
    month = [*1..12]
    exp_month = []
    month.each do |i|
      exp_month << [i.to_s.rjust(2, "0"), i]
    end
    return exp_month
  end

  def card_year
    year = [*2020..2030]
    exp_year = []
    year.each do |i|
      exp_year << [i.to_s.slice(2,3), i]
    end
    return exp_year
  end
end