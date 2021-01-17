FactoryBot.define do
  factory :contact do
    type { "" }
    title { "MyString" }
    content { "MyString" }
    tel { "MyString" }
    user { nil }
  end
end
