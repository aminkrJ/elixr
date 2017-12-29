json.extract! @cart, :id, :delivery_at, :reference_number, :subtotal, :total, :shipping_fee

json.cart_products @cart.cart_products do |cp|
  json.name cp.product.name
  json.quantity cp.quantity
end

if @cart.customer
  json.customer do
    json.email @cart.customer.email
    json.id @cart.customer.id
  end
end

if @cart.coupon
  json.coupon do
    json.id @cart.coupon.id
    json.code @cart.coupon.code
    json.description @cart.coupon.description
    json.shipping_fee @cart.coupon.shipping_fee
    json.subtotal @cart.coupon.subtotal
    json.total @cart.coupon.total
    json.discount @cart.coupon.discount
  end
end
