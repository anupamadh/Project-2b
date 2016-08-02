class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#relationship

attr_accessor :updating_user
#validation
  validates :name, :email, :phone, :address, presence: true
  validates :email, format: { with: EMAIL_REGEX}
  validates :phone, length: { maximum: 8, message: 'Too long'}
  validates :address, length: { maximum: 50, message: 'Too long'}
  validates :password, presence: true, length: { minimum: 5, message: 'Too short'}, unless: :updating_user
  validates :email, uniqueness: {case_sensitive: true}
  has_secure_password
end
