# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting orders from orders table..."
Order.destroy_all
puts "Deleting users from users table..."
User.destroy_all
puts "Deleting claims from claims table..."
Claim.destroy_all
puts "Deleting cars from cars table..."
Car.destroy_all
puts "Deleting parts from parts table..."
Part.destroy_all

puts "Generating new users....."
user_instances = [
{
  email: "nathanael@example.com",
  password: "123456"
},
{
  email: "romeo@example.com",
  password: "123456"
},
{
  email: "gael@example.com",
  password: "123456"
},
{
  email: "maarten@example.com",
  password: "123456"
},
{
  email: "insurance1@example.com",
  password: "123456"
}, {
  email: "insurance2@example.com",
  password: "123456"
}]

User.create!(user_instances)

puts "Generating new Orders every user gets 2 pending and sold orders...."
order_instances = [
{
  user_id: 1,
  status: "pending"
}, {
  user_id: 1,
  status: "paid"
},{
  user_id: 1,
  status: "pending"
}, {
  user_id: 1,
  status: "paid"
}, {
  user_id: 2,
  status: "paid"
}, {
  user_id: 2,
  status: "paid"
},{
  user_id: 2,
  status: "paid"
}, {
  user_id: 2,
  status: "paid"
}, {
  user_id: 3,
  status: "paid"
}, {
  user_id: 3,
  status: "paid"
},{
  user_id: 3,
  status: "paid"
}, {
  user_id: 3,
  status: "paid"
}, {
  user_id: 4,
  status: "paid"
}, {
  user_id: 4,
  status: "paid"
},{
  user_id: 4,
  status: "paid"
}, {
  user_id: 4,
  status: "paid"
}]

Order.create!(order_instances)

claim_instances = [
  {
  number: "123456789",
  at_date: "28-05-2019",
  description: "some stupid biker drove into my car. Now i have a broken headlight",
  user_id: 5
}, {
  number: "456785430",
  at_date: "12-05-2019",
  description: "Drove against a lantern...",
  user_id: 6
}, {
  number: "098765432",
  at_date: "2-05-2019",
  description: "Had some problems with the door",
  user_id: 6
}, {
  number: "748290205",
  at_date: "20-05-2019",
  description: "Got hit by an other car",
  user_id: 5
}]

Claim.create!(claim_instances)

car_instances = [
  {
  vin: "ZAM337B0000330279"
  make: "Maserati"
  model: "Quattroporte"
}, {
  vin: "WVWZZZ3BZ1P284396"
  make: "Volkswagen"
  model: "Passat"
},{
  vin: "VF1JMSE0637003170"
  make: "Renault"
  model: "Scenic"
},{
  vin: "ZAM337B0000330279"
  make: "Maserati"
  model: "Quattroporte"
},{
  vin: "ZAM337B0000330279"
  make: "Maserati"
  model: "Quattroporte"
},]

