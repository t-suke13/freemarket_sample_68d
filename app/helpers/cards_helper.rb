module CardsHelper
  #支払い方法で登録したクレジットカート会社のロゴイメージを呼び出すメソッド
  def card_company(brand)
    case brand
    when "Visa"
      "credit-card_22@0.5.png"
    when "JCB"
      "credit-card_28@0.5.png"
    when "MasterCard"
      "credit-card_9@0.5.png"
    when "American Express"
      "credit-card_19@0.5.png"
    when "Diners Club"
      "credit-card_31@0.5.png"
    when "Discover"
      "credit-card_15@0.5.png"
    end
  end

  #登録出来るクレジットカート会社のロゴイメージを呼び出すメソッド
  def card_logo
    return {
      "Visa" => "credit-card_22@0.5.png",
      "JCB" => "credit-card_28@0.5.png",
      "MasterCard" => "credit-card_9@0.5.png",
      "American Express" => "credit-card_19@0.5.png",
      "Diners Club" => "credit-card_31@0.5.png",
      "Discover" => "credit-card_15@0.5.png"
    }
  end
end
