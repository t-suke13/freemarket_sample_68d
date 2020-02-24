FactoryBot.define do
  factory :item do
    name                      {"ジャケット"}
    description               {"こちらは商品の説明になります。"}
    price                     {"1000"}
    prefecture_id             {"1"}
    condition_id              {"1"}
    shipping_fee_who_id       {"1"}
    shipping_days_id          {"1"}
    user                  
    category
  end
end