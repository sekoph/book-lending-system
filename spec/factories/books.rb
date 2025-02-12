FactoryBot.define do
    factory :book do
      title { "Sample Book" }
      author { "John Doe" }
      sequence(:isbn) { |n| "6723-2#{n}3-232" }
      available { true }
    end
  end
  