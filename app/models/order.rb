class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def items_in_cart
    self.cart_items.map do |cart_item|
      item = cart_item.item
      {
        id: cart_item.id,
        item_id: item.id,
        name: item.name,
        price: item.price,
        quantity: cart_item.quantity
      }
    end
  end
end
