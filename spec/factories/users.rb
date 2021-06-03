FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password              {'a000000'}
    password_confirmation {password}
    last_name              { "山田" }
    first_name              {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana        {"タロウ"}
    birth               {"1999-03-23"}
  end
end