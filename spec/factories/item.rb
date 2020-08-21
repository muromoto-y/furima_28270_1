FactoryBot.define do
  factory :item do
    name               { "せン濯ki" }
    explanation        { "aaaアアアあああ亜唖々000" }
    price              { 56747 }
    category_id        { 2 }
    status_id          { 2 }
    shipping_burden_id { 2 }
    shipping_area_id   { 2 }
    shipping_days_id   { 2 }
    association :user     
    
    trait :with_image do
      after(:build) { |item| item.image.attach(io: File.open(Rails.root.join('public', 'images', 'test.png')), filename: 'test.png', content_type: 'image/png') }
    end

  end
end