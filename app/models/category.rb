class Category < ApplicationRecord
    has_many :book_categories
    has_many :books, through: :book_categories
    validates :name, presence: true, length: {minimum: 3, maximum: 15}
    validates_uniqueness_of :name

    

 

end
