class Item < ApplicationRecord
  has_many :cart_items
  has_many :orders, through: :cart_items
  # has_many :users, through: :orders
end
