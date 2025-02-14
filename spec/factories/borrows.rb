FactoryBot.define do
  factory :borrow do
    user
    book
    borrowed_at { "2025-02-12 22:40:49" }
    returned_at { "2025-02-12 22:40:49" }
    due_date { "2025-02-12 22:40:49" }
    status { "borrowed" }
  end
end
