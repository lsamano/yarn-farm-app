class CartItemSerializer
  include FastJsonapi::ObjectSerializer
  # attributes
  belongs_to :item
end
