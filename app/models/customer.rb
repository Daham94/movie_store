class Customer < ApplicationRecord
  has_many :customers_movie_stocks_users
  has_many :movie_stocks, :through => :customers_movie_stocks_users
  has_many :users, :through => :customers_movie_stocks_users
  has_many :videos, :through => :reviews
  has_many :reviews, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
