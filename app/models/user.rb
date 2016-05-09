class User < ActiveRecord::Base
  has_many :topics
  has_many :posts

  validates :name, :email, :username, :password, presence: true, on: :create
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "not a valid email address" }
  validates :password, length: { in: 6..20, message: "password must be at least 6 characters" }
  has_secure_password
end
