FactoryBot.define do
  factory :user do
    first_name            {"室本"}
    last_name             {"幹臣"}
    irst_name_furigana    {"ヤマダ"}
    last_name_furigana    {"タロウ"}
    birthday              {""}
    nickname              {"あべ"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
  end
end