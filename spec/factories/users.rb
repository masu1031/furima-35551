FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname              { '野原' }
    firstname             { 'ひろし' }
    lastkana              { 'ノハラ' }
    firstkana             { 'ヒロシ' }
    birthday              { Faker::Date.birthday }
  end
end
