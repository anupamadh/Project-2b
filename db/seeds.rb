# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {name: "anu1",
   email: "anu5@gmail.com",
   address: "132 Tooty Road",
   phone:12345678,
   password: "12345678",
   password_confirmation: "12345678",
  admin: true},
  {name: "anu4",
   email: "anu4@gmail.com",
   address: "132 GA Road",
   phone:12345678,
   password: "12345678",
   password_confirmation: "12345678",
 admin: true},
 {name: "anu2",
  email: "anu2@gmail.com",
  address: "132 GA Road",
  phone:12345678,
  password: "12345678",
  password_confirmation: "12345678",
admin: false}
])

Product.create!([
{name: "Brooke Bond Green Tea",
 price: 2.49},
{name: "Magnolia Low Fat Milk",
 price: 5.49},
{name: "Tobblerone Chocolate",
 price: 10.99},
{name: "Chocolate Biscuits",
 price: 1.99},
{name: "Air Freshner",
 price: 8.00},
{name: "Organic Brown Rice",
 price: 20.00},
{name: "Marigold Orange",
 price: 6.00},
{name: "China Fuji Apple",
 price: 2.50},
{name: "Naturel Olive Oil",
 price: 12.50},
{name: "Yummy Tom Yum",
 price: 3.50},
])
