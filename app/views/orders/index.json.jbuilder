json.array!(@orders) do |order|
  json.extract! order, :id, :restaurant_id, :dish, :delivery_time, :delivery_date, :customer_phone, :customer_address, :order_status
  json.url order_url(order, format: :json)
end
