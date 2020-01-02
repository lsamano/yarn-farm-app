class User < ApplicationRecord
  has_secure_password
  has_many :orders

  def cart
    #grabs most recent cart (ex. the only open order)
    open_cart = self.orders.last
    {
      id: open_cart.id,
      items: open_cart.items_in_cart
    }
  end
end
