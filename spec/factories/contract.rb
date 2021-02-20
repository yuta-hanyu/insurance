FactoryBot.define do
  factory :user do
    contract_name { Faker::Lorem.characters(number:10) }
    policy_number { Faker::Lorem.numbers(number:10) }
  end
end