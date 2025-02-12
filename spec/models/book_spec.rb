require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is invalid without a isbn" do
    book = build(:book, isbn: nil)
    expect(book).not_to be_valid
  end

  it "is valid with attributes" do
    book = create(:book)
    expect(book).to be_valid
  end

  it "isbn must be unique" do
    book1 = build(:book, isbn: "1234567890")
    expect(book1.isbn).to eq("1234567890")
    expect(book1.isbn).not_to eq("0987654321")
  end

  it "isbn must be a string" do
    book = build(:book, isbn: 1234567890)
    expect(book.isbn).to be_a(String)
  end

  it "isbn is unique " do
    book1 = create(:book)
    expect(book1.isbn).not_to eq("6723-253-232")
  end
end
