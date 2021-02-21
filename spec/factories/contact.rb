FactoryBot.define do
  factory :contact do
    # belongs_toの関係性
    user
    # has_manyの関係性
    # comments {[
    # FactoryBot.build(:comment, contact: nil)
    # ]}
    type { Faker::Lorem.characters(number:30) }
    title { Faker::Lorem.characters(30) }
    content { Faker::Lorem.characters(number:100) }
  end
end
