class Review < ApplicationRecord
  belongs_to :item
  validates :rating, inclusion: { in: [1,2,3,4,5], message: "Ranting must be from 1 to 5."}
end
