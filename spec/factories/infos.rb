FactoryBot.define do
  factory :info do
    association :purchase
      postcode   {000-0000}
      city       {'横浜市'}
      block      {'横浜町'}
      building   {'横浜ビル'}
      tell_num   {00000000000}
      area_id    {2}
  end
end
