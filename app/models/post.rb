class Post < ApplicationRecord
  belongs_to :category
  has_many :tag
  has_many :comment, dependent: :destroy

  validates :title, :content, presence: true

  attribute :release, default: false

  def permalink
    "#{title.strip.downcase.gsub ' ','_'}"
  end
end
