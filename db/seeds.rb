# First destroy all the data still in the database
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


# Generating all the different seeds for the database
puts "Generating new users....."
nathanael = User.create!(first_name: "Nathanael", last_name: "Alain", company_name: "PDR-team", email: "nathanael@example.com",password: "123456")
romeo = User.create!(first_name: "Romeo", last_name: "Saint-Albin", company_name: "Le Wagon",email: "romeo@example.com", password: "123456")
gael = User.create!(first_name: "Gael", last_name: "Tims", company_name: "Swap Fiets",email: "gael@example.com", password: "123456")
maarten = User.create!(first_name: "Maarten", last_name: "Esser", company_name: "Felyx",email: "maarten@example.com", password: "123456")
insurance1 = User.create!(first_name: "Helmut", last_name: "Hermanns", company_name: "DEVK",email: "insurance1@example.com", password: "123456", insurance: true)
insurance2 = User.create!(first_name: "Siegmund", last_name: "Meier", company_name: "Axa",email: "insurance2@example.com", password: "123456", insurance: true)

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
part1 = Part.new(part_model_code: "A2208100416", title: "Mirror Right", description: "Right mirror of a mercedes benz", category: "used", car: mercedes_benz, user: nathanael, claim: claim1, price_cents: "40185")
part1[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062840/Foto%27s%20parts/Mercedes/RightMirror/rightmirror2.jpg"
part1.save!

part2 = Part.new(part_model_code: "2208100116", title: "Left Mirror", description: "Left mirror without mirror Mercedes Benz", category: "used", car: mercedes_benz, user: nathanael, claim: claim1, price_cents: "14000")
part2[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Mercedes/LeftMirror/LeftMirrorMercedes4.jpg"
part2.save!

part3 = Part.new(part_model_code: "6803-00-9540280P", title: "Bonnet for VW Passat", description: "Bonnet for VW passat 2012", category: "new", car: volkswagen, user: romeo, claim: claim2, price_cents: "18051")
part3[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062839/Foto%27s%20parts/Volkswagen/bonnet/bonnet1.jpg"
part3.save!

part4 = Part.new(part_model_code: "3C5827025H", title: "Tailgate VW Passat", description: "Tailgate VW Passat without any extra parts and two bump's", category: "new", car: volkswagen, user: romeo, claim: claim2, price_cents: "12890")
part4[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062840/Foto%27s%20parts/Volkswagen/tailgate/tailgate3.jpg"
part4.save!

part5 = Part.new(part_model_code: "B204I", title: "Right back door Saab", description: "Right back door Saab", category: "used", car: saab, user: gael, claim: claim3, price_cents: "11099")
part5[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062839/Foto%27s%20parts/Saab/right%20door/rightdoor.jpg"
part5.save!

part6 = Part.new(part_model_code: "B204L", title: "Front gril of Saab", description: "Almost new Frontgrill Saad", category: "used", car: saab, user: gael, claim: claim3, price_cents: "6980")
part6[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Saab/front%20gril/gril1.jpg"
part6.save!

part7 = Part.new(part_model_code: "M139A", title: "Left mirror Maserati Quattroporte", description: "Used Left mirror Maserati Quattroporte", category: "used", car: maserati, user: maarten, claim: claim4, price_cents: "14890")
part7[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062842/Foto%27s%20parts/Maserati/left%20mirror/leftmirror2.jpg"
part7.save!

part8 = Part.new(part_model_code: "M139A", title: "Right mirror Maserati Quattroporte", description: "Used Right mirror Maserati Quattroporte", category: "used", car: maserati, user: maarten, claim: claim4, price_cents: "16980")
part8[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Maserati/right%20mirror/rightmirror1.jpg"
part8.save!


puts "Generating new Orders every user gets 2 pending and sold orders...."
order1 = Order.create!(user: nathanael, status: "pending", part: part2)
order2 = Order.create!(user: nathanael, status: "paid", part: part4)
order3 = Order.create!(user: romeo, status: "paid", part: part8)
order4 = Order.create!(user: romeo, status: "pending", part: part6)
order5 = Order.create!(user: gael, status: "pending", part: part5)
order6 = Order.create!(user: gael, status: "paid", part: part1)
order7 = Order.create!(user: maarten, status: "pending", part: part7)
order8 = Order.create!(user: maarten, status: "paid", part: part3)

puts "Done with seeding the whole database"

