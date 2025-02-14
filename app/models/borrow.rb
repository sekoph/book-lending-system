class Borrow < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_at, presence:true
  validates :status, inclusion: {in: %w[borrowed returned overdue]}
  validates :due_date, presence: true

  def return_book?
    status == "returned"
  end
end
