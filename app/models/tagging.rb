class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :post
  accepts_nested_attributes_for :tag
end
