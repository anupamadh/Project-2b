class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, presence: true
  validates :content, length: { minimum: 1,message: 'Review cannot be blank' }
end
