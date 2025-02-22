class User < ApplicationRecord
  belongs_to :user_level
  has_many :customers_movie_stocks_users
  has_many :customers, :through => :customers_movie_stocks_users
  has_many :movie_stocks, :through => :customers_movie_stocks_users
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :user_level_id, presence: true
end
