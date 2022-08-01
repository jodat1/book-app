class Book < ApplicationRecord
    has_many :book_categories
    has_many :categories, through: :book_categories
    has_one_attached :image

end
