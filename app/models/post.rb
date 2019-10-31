class Post < ApplicationRecord
  belongs_to :category
  has_many :tag
  
  validates :title, :post_body, :release, presence: true
  validates :permalink, uniqueness: true

end
