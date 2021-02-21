FactoryBot.define do
  factory :post do
    # belongs_toの関係性
    user
    title { Faker::Lorem.characters(number:10) }
    content { Faker::Lorem.characters(50) }
    post_img_id { Faker::Lorem.characters(number:10) }
  end
end