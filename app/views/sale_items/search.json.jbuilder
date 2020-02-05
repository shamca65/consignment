json.items do
  json.array!(@items) do |item|
    json.id item.id
    json.id_str item.id_str
    json.description item.description
    json.size item.size
    json.price item.price
  end
end