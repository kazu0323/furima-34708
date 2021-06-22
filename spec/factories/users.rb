FactoryBot.define do
  factory :user do
    name              {'test'}
    email {Faker::Internet.free_email}
    password              {'test0000'}
    password_confirmation {'test0000'}
    last_name              { "山田" }
    first_name              {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana        {"タロウ"}
    birth               {"1999-03-23"}
  end
end