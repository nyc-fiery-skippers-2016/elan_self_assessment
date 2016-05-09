class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :title, presence: true, on: :create
  validates :title, presence: true, on: :update
end
