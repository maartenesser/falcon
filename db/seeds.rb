# first destroy all the data still in the database
puts "Deleting parts from parts table..."
Part.destroy_all
puts "Deleting orders from orders table..."
Order.destroy_all
puts "Deleting claims from claims table..."
Claim.destroy_all
puts "Deleting all Users from Users table..."
User.destroy_all
puts "Deleting users from users table..."
User.destroy_all
puts "Deleting cars from cars table..."
Car.destroy_all



# generating all the differend seeds for the database
puts "Generating new users....."
nathanael = User.create!(email: "nathanael@example.com",password: "123456")
romeo = User.create!(email: "romeo@example.com", password: "123456")
gael = User.create!(email: "gael@example.com", password: "123456")
maarten = User.create!(email: "maarten@example.com", password: "123456")
insurance1 = User.create!(email: "insurance1@example.com", password: "123456", insurance: true)
insurance2 = User.create!(email: "insurance2@example.com", password: "123456", insurance: true)

puts "Generating new Orders every user gets 2 pending and sold orders...."
order1 = Order.create!(user: nathanael, status: "pending")
order2 = Order.create!(user: nathanael, status: "paid")
order3 = Order.create!(user: romeo, status: "paid")
order4 = Order.create!(user: romeo, status: "pending")
order5 = Order.create!(user: gael, status: "pending")
order6 = Order.create!(user: gael, status: "paid")
order7 = Order.create!(user: maarten, status: "pending")
order8 = Order.create!(user: maarten, status: "paid")
order9 = Order.create!(user: nathanael, status: "pending")
order10 = Order.create!(user: nathanael, status: "paid")

puts "Generating new Claims....."
claim1 = Claim.create!(number: "123456789", at_date: "28-05-2019", description: "some stupid biker drove into my car. Now i have a broken headlight", user: insurance1)
claim2 = Claim.create!(number: "456785430", at_date: "12-05-2019", description: "Drove against a lantern...", user: insurance2)
claim3 = Claim.create!(number: "098765432", at_date: "2-05-2019", description: "Had some problems with the door", user: insurance2)
claim4 = Claim.create!(number: "748290205", at_date: "20-05-2019", description: "Got hit by an other car", user: insurance1)

puts "Generating new cars....."
maserati = Car.create!(vin: "ZAM337B0000330279", make: "Maserati", model: "Quattroporte")
volkswagen = Car.create!(vin: "WVWZZZ3BZ1P284396", make: "Volkswagen", model: "Passat")
saab = Car.create!(vin: "YS3AL76L1R7002116", make: "Saab", model: "900")
mercedes_benz = Car.create!(vin: "WDBNG75J32A225892", make: "Mercedes Benz", model: "S Class")

puts "Generating new parts....."
part1 = Part.create!(part_model_code: "A2208100416", title: "Mirror Right", description: "Right mirror of a mercedes benz", category: "used", car: mercedes_benz, user: nathanael, claim: claim1, order: order3)#, price_cents: "40185")
part1 = Part.create!(part_model_code: "2208100116", title: "Left Mirror", description: "Left mirror without mirror Mercedes Benz", category: "used", car: mercedes_benz, user: nathanael, claim: claim1, order: order4)#, price_cents: "14000")
part1 = Part.create!(part_model_code: "6803-00-9540280P", title: "Bonnet for VW Passat", description: "Bonnet for VW passat 2012", category: "new", car: volkswagen, user: romeo, claim: claim2, order: order1)#, price_cents: "18051")
part1 = Part.create!(part_model_code: "3C5827025H", title: "Tailgate VW Passat", description: "Tailgate VW Passat without any extra parts and two bump's", category: "new", car: volkswagen, user: romeo, claim: claim2, order: order2)#, price_cents: "12890")
part1 = Part.create!(part_model_code: "B204I", title: "Right back door Saab", description: "Right back door Saab", category: "used", car: saab, user: gael, claim: claim3, order: order7)#, price_cents: "11099")
part1 = Part.create!(part_model_code: "B204L", title: "Front gril of Saab", description: "Almost new Frontgrill Saad", category: "used", car: saab, user: gael, claim: claim3, order: order8)#, price_cents: "6980")
part1 = Part.create!(part_model_code: "M139A", title: "Left mirror Maserati Quattroporte", description: "Used Left mirror Maserati Quattroporte", category: "used", car: maserati, user: maarten, claim: claim4, order: order5)#, price_cents: "14890")
part1 = Part.create!(part_model_code: "M139A", title: "Right mirror Maserati Quattroporte", description: "Used Right mirror Maserati Quattroporte", category: "used", car: maserati, user: maarten, claim: claim4, order: order6)#, price_cents: "16980")

puts "Done with seeding the whole database"

