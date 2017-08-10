json.extract! @cart, :id, :reference_number

if @cart.coupon
  json.coupon do
    json.code @cart.coupon.code
    json.description @cart.coupon.description
    json.shipping_fee @cart.coupon.shipping_fee
    json.subtotal @cart.coupon.subtotal
    json.total @cart.coupon.total
    json.redeemable @cart.coupon.redeemable?
  end
end
