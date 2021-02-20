FactoryBot.define do
  factory :user do
    # パスワード再確認用に変数定義
    password = Faker::Internet.password(min_length: 6, max_length: 8)
    # user_id { Faker::Lorem.characters(number:5) }
    contractor_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password}
    password_confirmation { password }
    address { Faker::Lorem.characters(number:10) }
  end
end