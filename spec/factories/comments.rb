FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    contact { nil }
  end
end
