FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {Faker::Name.initials(number: 2)}
    firstname             {Faker::Name.initials(number: 2)}
    lastkana              {Faker::Name.initials(number: 2)}
    firstkana             {Faker::Name.initials(number: 2)}
    birthday              {Faker::Date.birthday}
  end
end