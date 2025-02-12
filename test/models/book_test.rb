require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "the book will not save without body" do
    book = Book.new(body: nil)
    assert_not book.save "save the book without body"
  end
end
