FactoryBot.define do
  factory :item do
    name            { Faker::Name.initials(number: 2) }
    introduce       { Faker::Lorem.sentence }
    category_id     { 2 }
    status_id       { 2 }
    burden_id       { 2 }
    prefecture_id   { 2 }
    day_id          { 2 }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
