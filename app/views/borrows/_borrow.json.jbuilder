json.extract! borrow, :id, :user_id, :book_id, :borrowed_at, :returned_at, :status, :created_at, :updated_at
json.url borrow_url(borrow, format: :json)
