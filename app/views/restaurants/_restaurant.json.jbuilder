json.extract! restaurant, :id, :sku, :name, :rating, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)