class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, presence: true
  validates :content, length: { minimum: 1, message: 'Please enter your review'}
end
