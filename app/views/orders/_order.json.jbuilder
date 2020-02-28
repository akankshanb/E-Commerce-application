json.extract! order, :id, :status, :quantity, :price, :user_id, :item_id, :created_at, :updated_at
json.url order_url(order, format: :json)
