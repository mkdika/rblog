class Tag < ApplicationRecord
    has_paper_trail
    
    has_many :taggings
    has_many :posts, through: :taggings
    validates :name, presence: true, uniqueness: true
end
