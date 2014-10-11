json.array!(@orders) do |order|
  json.extract! order, :id, :profile_id, :order_number, :subtotal
  json.url order_url(order, format: :json)
end
