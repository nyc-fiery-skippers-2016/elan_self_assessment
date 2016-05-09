class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :title, presence: true, on: :create
  validates :title, presence: true, on: :update
end
