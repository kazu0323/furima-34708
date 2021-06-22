FactoryBot.define do
  factory :purchase_information do
          postcode   {'000-0000'}
          city       {'横浜市'}
          block      {'横浜町'}
          building   {'横浜ビル'}
          tell_num   {'09033294923'}
          area_id    {2}
          token {"tok_abcdefghijk00000000000000000"}
          item_id    {1}
          user_id    {1}
  end
end