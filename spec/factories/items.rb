FactoryBot.define do
  factory :item do
    association :user
    item_name              {'test'}
    item_info              {'test'}
    price              {3000}
    day_id              {2}
    category_name_id             {2}
    freight_money_id              {2}
    states_id              {2}
    area_id             {2}
  end
end
