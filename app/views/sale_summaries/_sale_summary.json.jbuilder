json.extract! sale_summary, :id, :sale_total, :order_no, :sale_date, :created_at, :updated_at
json.url sale_summary_url(sale_summary, format: :json)
