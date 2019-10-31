class Tag < ApplicationRecord
    validates :name, presence: true, uniqeness: true
end
