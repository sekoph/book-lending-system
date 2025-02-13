FactoryBot.define do
  factory :borrow do
    user { nil }
    book { nil }
    borrowed_at { "2025-02-12 22:40:49" }
    returned_at { "2025-02-12 22:40:49" }
    status { "MyString" }
  end
end
