class OrderSerializer
  include FastJsonapi::ObjectSerializer
  has_many :cart_items
end
