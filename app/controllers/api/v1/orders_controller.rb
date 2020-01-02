class Api::V1::OrdersController < ApplicationController
  def checkout
    @order = current_user.cart
    # checkout logic
    Order.create(user: current_user)
  end
end
