# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CartItem.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

user = User.create(
  username: "Eme",
  password: "eme"
)

order = Order.create(user_id: user.id)

item1 = Item.create(
  name: "Bernat Maker Home Dec Yarn",
  price: 9.99
)

item2 = Item.create(
  name: "La Mia 100% Merino Wool Yarn",
  price: 20.99
)

  CartItem.create(
    order_id: order.id,
    item_id: item1.id,
    quantity: 2
  )

  CartItem.create(
    order_id: order.id,
    item_id: item2.id,
    quantity: 1
  )

puts "Seeded."
