json.items do
  json.array!(@items) do |item|
    json.id item.id
    json.description item.description
  end
end