FactoryBot.define do
  factory :purchase_order do
    post_code       {"123-4567"}
    prefecture_id   {5}
    city            {"愛知県"}
    address         {"1-1"}
    building_name   {"テスト"}
    phone_number    {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
