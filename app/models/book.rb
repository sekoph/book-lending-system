class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true, uniqueness: true

    has_many :borrows
    has_many :users, through: :borrows
end
