class LineItem < ApplicationRecord
  has_many :line_items
  belongs_to :cart
  belongs_to :item
  belongs_to :user

end
