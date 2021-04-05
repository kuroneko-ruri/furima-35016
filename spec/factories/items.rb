FactoryBot.define do
  factory :item do
    name { 'tesuto' }
    description { 'テスト' }
    price { 5000 }
    condition_id       { 2 }
    cost_id            { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    category_id        { 2 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
