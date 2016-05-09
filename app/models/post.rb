class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: true, on: :create
  validates :title, presence: true, on: :update
end
