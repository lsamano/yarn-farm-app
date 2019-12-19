class User < ApplicationRecord
  has_many :orders

  def cart
    #grabs most recent cart (ex. the only open order)
    orders.last
  end
end
