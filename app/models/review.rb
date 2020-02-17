class Review < ApplicationRecord
  belongs_to :item
  # the rating should be in the range of [1,5]
  validates :rating, inclusion: { in: [1,2,3,4,5], message: "Ranting must be from 1 to 5."}
end
