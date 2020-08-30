FactoryBot.define do
  factory :deliverie_purchase do
    post_code        { "123-1234" }
    city             { "新宿区" }
    address          { "歌舞伎町2-37-1" }
    building_name    {} 
    phone_number     { "08012345678" } 
    shipping_area_id { 32 }
    user_id          { 1 }
    item_id          { 3 } 
    token            { "aaaaa" }
  end
end


