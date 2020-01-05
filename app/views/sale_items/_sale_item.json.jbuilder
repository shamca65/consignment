json.extract! sale_item,
              :id, :price, :description, :size, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
