class Subscribe < ApplicationRecord
  belongs_to :item
  belongs_to :user

  # validating the uniqueness of the item_id and user_id
  # validates_uniqueness_of :item_id, :scope => [:user_id], message: "You have already subscribed!"

  # to create a new entry
  # def self.update_sub(item, user)
  #   Subscribe.create(:item_id => item.id, :user_id => user.id)
  # end
end
