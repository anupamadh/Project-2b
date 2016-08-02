class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
def self.search(search)
  where("name LIKE ?", "%#{search}%")
end
end
