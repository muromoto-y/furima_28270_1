FactoryBot.define do
  factory :user do
    first_name            {"室本"}
    last_name             {"幹臣"}
    first_name_furigana    {"ヤマダ"}
    last_name_furigana    {"タロウ"}
    birthday              {"2020-12-31"}
    nickname              {"あべ"}
    email                 {"kkk@gmail.com"}
    password              {"000aaa"}
    password_confirmation {password}
  end
end