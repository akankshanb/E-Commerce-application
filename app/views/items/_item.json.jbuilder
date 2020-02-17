json.extract! item, :id, :brand, :name, :category, :quantity, :cost, :purchases, :available, :special, :restricted, :age_restricted, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
