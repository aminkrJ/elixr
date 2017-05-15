json.extract! coupon, :id, :name, :amount, :active, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
