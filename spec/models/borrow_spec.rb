require 'rails_helper'

RSpec.describe Borrow, type: :model do
  it "correctly creates a borrow" do
    borrow = create(:borrow)
    expect(borrow).to be_valid
  end

  it "incorrectly creates a borrow without user and book" do
    borrow = build(:borrow, user: nil, book: nil)
    expect(borrow).not_to be_valid
  end

  it "incorrectly returns book" do
    borrow = build(:borrow, returned_at: nil)
    expect(borrow).not_to be_return_book
  end

  it "correctly returns book" do
    borrow = build(:borrow, returned_at: Time.current, borrowed_at: Time.current, due_date: Time.current + 2.weeks, status: "returned")
    expect(borrow).to be_return_book
  end
end
