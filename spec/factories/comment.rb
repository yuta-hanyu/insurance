FactoryBot.define do
  factory :comment do
    # belongs_toの関係性
    user
    contact
    
    content { Faker::Lorem.characters(number:100) }
  end
end
