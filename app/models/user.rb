class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#relationship

attr_accessor :upd_user
#validation
  validates :name, :email, :phone, :address, presence: true
  validates :email, format: { with: EMAIL_REGEX}
  validates :phone, length: { maximum: 8, message: 'Too long. Maximum 8 characters'}
  validates :address, length: { maximum: 50, message: 'Too long. Maximum 50 characters'}
  validates :password, presence: true, length: { minimum: 5, message: 'Too short. Enter atleast 5 characters'}, unless: :upd_user
  validates :email, uniqueness: {case_sensitive: true}
  has_secure_password
end
