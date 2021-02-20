FactoryBot.define do
  factory :claim do
    # belongs_toの関係性
    user
    patient { Faker::Lorem.characters(number:10) }
    policy_number { Faker::Number.number(10) }
    hospital_stay { Faker::Date.backward }
    account_number { Faker::Number.number(10) }
    receipt_img_id { Faker::Lorem.characters(number:10) }
    destination { Faker::Address.full_address }
    illness { Faker::Lorem.characters(number:10) }
  end
end