json.items do
  json.array!(@items) do |item|
    json.id item.id
    json.description item.description
    json.size item.size
    json.price item.price
    json.dummy item.id
  end
end
