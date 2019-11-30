class Category < ApplicationRecord
  has_paper_trail

  validates :name, presence: true, uniqueness: true
end
