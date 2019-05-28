# first destroy all the data still in the database
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

# generating all the differend seeds for the database
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
  user_id: 2,
  status: "paid"
}, {
  user_id: 2,
  status: "pending"
}, {
  user_id: 3,
  status: "pending"
}, {
  user_id: 3,
  status: "paid"
}, {
  user_id: 4,
  status: "pending"
}, {
  user_id: 4,
  status: "paid"
}, {
  user_id: 1,
  status: "pending"
}, {
  user_id: 1,
  status: "paid"
}]

Order.create!(order_instances)

puts "Generating new Claims....."
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

puts "Generating new cars....."
car_instances = [
  {
  vin: "ZAM337B0000330279",
  make: "Maserati",
  model: "Quattroporte"
}, {
  vin: "WVWZZZ3BZ1P284396",
  make: "Volkswagen",
  model: "Passat"
},{
  vin: "YS3AL76L1R7002116",
  make: "Saab",
  model: "900"
},{
  vin: "WDBNG75J32A225892",
  make: "Mercedes Benz",
  model: "S Class"
}]

Car.create!(car_instances)

puts "Generating new parts....."
part_instances = [
{
  part_model_code: "A2208100416",
  title: "Mirror Right",
  description: "Right mirror of a mercedes benz",
  category: "used",
  card_id: "4",
  user_id: "1",
  claim_id: "1",
  order_id: "3",
  # price_cents: "40185"
},{
  part_model_code: "2208100116",
  title: "Left Mirror",
  description: "Left mirror without mirror Mercedes Benz",
  category: "used",
  card_id: "4",
  user_id: "1",
  claim_id: "1",
  order_id: "4"
  # price_cents: "14000"
},{
  part_model_code: "6803-00-9540280P",
  title: "Bonnet for VW Passat",
  description: "Bonnet for VW passat 2012",
  category: "new",
  card_id: "2",
  user_id: "2",
  claim_id: "2",
  order_id: "1"
  # price_cents: "18051"

},{
  part_model_code: "3C5827025H",
  title: "Tailgate VW Passat",
  description: "Tailgate VW Passat without any extra parts and two bump's",
  category: "new",
  card_id: "2",
  user_id: "2",
  claim_id: "2",
  order_id: "2"
  # price_cents: "12890"
},{
  part_model_code: "B204I",
  title: "Right back door Saab",
  description: "Right back door Saab",
  category: "used",
  card_id: "3",
  user_id: "3",
  claim_id: "3",
  order_id: "7"
  # price_cents: "11099"
},{
  part_model_code: "B204L",
  title: "Front gril of Saab",
  description: "Almost new Frontgrill Saad",
  category: "used",
  card_id: "3",
  user_id: "3",
  claim_id: "3",
  order_id: "8"
  # price_cents: "6980"
},{
  part_model_code: "M139A",
  title: "Left mirror Maserati Quattroporte",
  description: "Used Left mirror Maserati Quattroporte",
  category: "used",
  card_id: "1",
  user_id: "4",
  claim_id: "4",
  order_id: "9"
  # price_cents: "14890"
},{
  part_model_code: "M139A",
  title: "Right mirror Maserati Quattroporte",
  description: "Used Right mirror Maserati Quattroporte",
  category: "used",
  card_id: "1",
  user_id: "4",
  claim_id: "4",
  order_id: "10"
  # price_cents: "16980"
}]
Part.create!(part_instances)

puts "Done with seeding the whole database"

