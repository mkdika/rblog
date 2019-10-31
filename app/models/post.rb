class Post < ApplicationRecord
  belongs_to :category
  has_many :tag
  has_many :comment, dependent: :destroy

  validates :title, :content, :release, presence: true
  validates :permalink, uniqueness: true
end