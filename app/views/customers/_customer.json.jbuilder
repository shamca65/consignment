json.extract! customer, :id, :fname, :lname, :created_at, :updated_at
json.url customer_url(customer, format: :json)
