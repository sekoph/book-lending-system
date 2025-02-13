class Borrow < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_at, presence:true
  validates :returned_at, presence: true
  validates :status, inclusion: {in: %w[borrowed returned overdue]}
end
