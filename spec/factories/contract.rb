FactoryBot.define do
  factory :contract do
    # belongs_toの関係性
    user
    contract_name { Faker::Lorem.characters(number:10) }
    policy_number { Faker::Number.number(10) }
  end
end