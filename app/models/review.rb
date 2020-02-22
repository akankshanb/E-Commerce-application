class Review < ApplicationRecord
  belongs_to :item
  validates :rating, inclusion: { in: [1,2,3,4,5], message: "Rating must be from 1 to 5."}
end
