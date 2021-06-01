FactoryBot.define do
  factory :order_address do
    token           { 'tok_abcdefghijk00000000000000000' }
    postal_code     { '344-0016' }
    prefecture_id   { 12 }
    city            { '春日部市' }
    house_number    { '双葉町904' }
    building_name   {}
    phone           { '0123456789' }
    association :item
  end
end
