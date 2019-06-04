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
romeo = User.create!(first_name: "Romeo", last_name: "Saint-Albin", company_name: "Romeoauto Manchester Ltd.",email: "romeo@example.com", password: "123456")
gael = User.create!(first_name: "Gael", last_name: "Tims", company_name: "Autocar GmbH Garage - Berlin",email: "gael@example.com", password: "123456")
maarten = User.create!(first_name: "Maarten", last_name: "Esser", company_name: "DriveNow",email: "maarten@example.com", password: "123456")
insurance1 = User.create!(first_name: "Helmut", last_name: "Hermanns", company_name: "DEVK",email: "insurance1@example.com", password: "123456", insurance: true)
insurance2 = User.create!(first_name: "Siegmund", last_name: "Meier", company_name: "Axa",email: "insurance2@example.com", password: "123456", insurance: true)
insurance3 = User.create!(first_name: "Max", last_name: "Janssen", company_name: "Aviva", email: "insurance3@example.com", password: "123456", insurance: true)
insurance4 = User.create!(first_name: "Rolf", last_name: "Heidelbeck", company_name: "ADAC", email: "insurance4@example.com", password: "123456", insurance: true)


puts "Generating new Claims....."
claim1 = Claim.create!(number: "613261233", at_date: "28-05-2019", description: "Bicyclist hit car. Front right headlight damaged & mirror damage, light damage on body panels near front right headlight", user: insurance1, garage_id: nathanael.id)
claim2 = Claim.create!(number: "455331230", at_date: "12-05-2019", description: "Drove against a lantern and damaged bonnet & front windshield", user: insurance2, garage_id: romeo.id)
claim3 = Claim.create!(number: "098723331", at_date: "02-05-2019", description: "Issues opening door, broken doorhandle as a result of wear & tear", user: insurance1, garage_id: gael.id, status: "in progress")
claim4 = Claim.create!(number: "385203985", at_date: "21-04-2019", description: "Rear-end pile-up on highway, car was hit from behind at medium speed. Airbags & whiplash system in seat activated", user: insurance1, garage_id: maarten.id)
claim5 = Claim.create!(number: "748292355", at_date: "27-03-2019", description: "Driver lost control in the rain and had a side impact with a curb. Rear right wheel/tire & suspension components damaged", user: insurance1, garage_id: gael.id, status: "in progress")
claim6 = Claim.create!(number: "791250321", at_date: "13-05-2019", description: "Hail damage on body work, glass intact but bonnet/roof/bootlid/fenders damaged", user: insurance1, garage_id: gael.id)
claim7 = Claim.create!(number: "910413496", at_date: "19-05-2019", description: "Flooding in garage, engine seized & wiring harness need replacing", user: insurance1, garage_id: gael.id)
claim8 = Claim.create!(number: "162316332", at_date: "03-06-2019", description: "Sunroof stopped working, rear glass panel doesn't operate anymore", user: insurance4, garage_id: gael.id)
claim9 = Claim.create!(number: "531900512", at_date: "01-06-2019", description: "Front right headlight damaged in parking garage (driver hit a small pole)", user: insurance1, garage_id: gael.id)
claim10 = Claim.create!(number: "602366301", at_date: "30-05-2019", description: "Driver hit highway divider due to falling asleep, full left side body damage", user: insurance1, garage_id: gael.id, status: "finished")
claim11 = Claim.create!(number: "261233610", at_date: "04-05-2019", description: "Rear bumper damage when reversing in garage, parking sensors need to be replaced", user: insurance1, garage_id: gael.id)
claim12 = Claim.create!(number: "414321260", at_date: "09-05-2019", description: "Left rear rim & tire damage from parking accident (driver scratched against a high curb)", user: insurance1, garage_id: gael.id, status: "in progress")
claim13 = Claim.create!(number: "863102351", at_date: "14-03-2019", description: "Small animal was hit driving at highway speed, front bumper & radiator + washer bottle need replacing", user: insurance1, garage_id: gael.id)
claim14 = Claim.create!(number: "615230511", at_date: "22-02-2019", description: "Rear tailgate was open while driver was moving his car in personal garage - rear tailgate left hinge broken", user: insurance1, garage_id: gael.id)
claim15 = Claim.create!(number: "742360122", at_date: "19-01-2019", description: "Car + tram collision - front right side full repair (fender + headlight + sensors + radiator + fog light + frame damage)", user: insurance1, garage_id: gael.id, status: "reclaimed")
claim16 = Claim.create!(number: "362123530", at_date: "07-06-2019", description: "Exhaust hanger broke loose on highway - headers back need replacing", user: insurance3, garage_id: gael.id)


puts "Generating new cars....."
maserati = Car.create!(vin: "ZAM337B0000330279", make: "Maserati", model: "Quattroporte 4.2")
volkswagen = Car.create!(vin: "WVWZZZ3BZ1P284396", make: "Volkswagen", model: "Passat 2.0TDI")
saab = Car.create!(vin: "YS3AL76L1R7002116", make: "Saab", model: "900 Turbo")
mercedes_benz = Car.create!(vin: "WDBNG75J32A225892", make: "Mercedes-Benz", model: "S500")
peugeot = Car.create!(vin: "1N6AA0EJ5CN308711", make: "Peugeot", model: "3008 1.6d")
volvo = Car.create!(vin: "YV4A22NL0H1001195", make: "Volvo", model: "V90 Cross Country T6")
mazda = Car.create!(vin: "JM3KE2DY6G0724539", make: "Mazda", model: "CX-5 2.2d")
bmw = Car.create!(vin: "5UXWX9C50F0D50028", make: "BMW", model: "X3 s35i")
audi = Car.create!(vin: "WAUFFAFL4FA068866", make: "Audi", model: "A4 2.0T")
renault = Car.create!(vin: "VF1BMK40638226064", make: "Renault", model: "Megane 1.8")
seat = Car.create!(vin: "VSSZZZ6JZAR035500", make: "Seat", model: "Ibiza")
peugeot2 = Car.create!(vin: "VF3CC9HP0DT076568", make: "Peugeot", model: "208")
mini = Car.create!(vin: "WMWLN5C5XK2E34890", make: "Mini", model: "Clubman Cooper S All4")
tesla = Car.create!(vin: "5YJ3E1EA9JF002824", make: "Tesla", model: "Model S P85D")
volkswagen2 = Car.create!(vin: "WVWZZZ6NZTY112309", make: "Volkswagen", model: "Up 1.0")
ford = Car.create!(vin: "1FAHP3F26CL228943", make: "Ford", model: "Focus 2.0tdci")


puts "Generating new parts....."
part1 = Part.new(part_model_code: "A2208100416", title: "Mirror Right", description: "Right mirror of a mercedes benz S500", condition: "used", category: "electric", car: mercedes_benz, user: nathanael, claim: claim1, price_cents: "40185")
part1[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062840/Foto%27s%20parts/Mercedes/RightMirror/rightmirror2.jpg"
part1.save!

part2 = Part.new(part_model_code: "2208100116", title: "Left Mirror", description: "Left mirror without mirror Mercedes-Benz S500", condition: "used", category: "electric", car: mercedes_benz, user: nathanael, claim: claim1, price_cents: "14000")
part2[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Mercedes/LeftMirror/LeftMirrorMercedes4.jpg"
part2.save!

part3 = Part.new(part_model_code: "6803-00-9540280P", title: "Bonnet for VW Passat", description: "Bonnet for VW passat 2012", condition: "new", category: "body", car: volkswagen, user: romeo, claim: claim2, price_cents: "18051")
part3[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062839/Foto%27s%20parts/Volkswagen/bonnet/bonnet1.jpg"
part3.save!

part4 = Part.new(part_model_code: "3C5827025H", title: "Tailgate VW Passat", description: "Tailgate VW Passat without any extra parts and two dents", category: "body", condition: "new", car: volkswagen, user: romeo, claim: claim2, price_cents: "12890")
part4[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062840/Foto%27s%20parts/Volkswagen/tailgate/tailgate3.jpg"
part4.save!

part5 = Part.new(part_model_code: "B204I", title: "Right back door Saab 900", description: "Right back door Saab", condition: "used", car: saab, user: gael, category: "body", claim: claim3, price_cents: "11099")
part5[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062839/Foto%27s%20parts/Saab/right%20door/rightdoor.jpg"
part5

part6 = Part.new(part_model_code: "B204L", title: "Front gril of Saab 900", description: "Almost new Frontgrill Saab", condition: "used", car: saab, user: gael, category: "body", claim: claim3, price_cents: "6980")
part6[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Saab/front%20gril/gril1.jpg"
part6.save!

part7 = Part.new(part_model_code: "M139A", title: "Left mirror Maserati Quattroporte", description: "Used Left mirror Maserati Quattroporte", condition: "used", category: "electric", car: maserati, user: maarten, claim: claim4, price_cents: "14890")
part7[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062842/Foto%27s%20parts/Maserati/left%20mirror/leftmirror2.jpg"
part7.save!

part8 = Part.new(part_model_code: "M138A", title: "Right mirror Maserati Quattroporte", description: "Used Right mirror Maserati Quattroporte", condition: "used",category: "electric",  car: maserati, user: maarten, claim: claim4, price_cents: "16980")
part8[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559062841/Foto%27s%20parts/Maserati/right%20mirror/rightmirror1.jpg"
part8.save!

part9 = Part.new(part_model_code: "9809687377", title: "Rear rim peugeot 3008", description: "18inch 7.5j", condition: "used", category: "wheel",  car: peugeot, user: nathanael, claim: claim5, price_cents: "45500")
part9[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559652400/Foto%27s%20parts/Peugeot/s-l1600_x7tou6.jpg"
part9.save!

part10 = Part.new(part_model_code: "4061965603978", title: "Front right fender Peugeot 3008", description: "Front right fender (plastic) - no mounting hardware 2009-2014 peugeot 3008", condition: "used", category: "body",  car: peugeot, user: nathanael, claim: claim5, price_cents: "32050")
part10[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559652098/Foto%27s%20parts/Peugeot/s-l1600_zu9v3r.jpg"
part10.save!

part11 = Part.new(part_model_code: "31386635", title: "Bonnet Volvo V90", description: "Front bonnet V90 Storm Grey - hail damage", condition: "used", category: "body",  car: volvo, user: maarten, claim: claim6, price_cents: "98500")
part11[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559652688/Foto%27s%20parts/Volvo/s-l1600_riamnm.jpg"
part11.save!

part12 = Part.new(part_model_code: "31383332", title: "Rear bumper Volvo V90 CC", description: "Rear bumper V90 CC - no sensors/electronics - inscription white", condition: "used", category: "body",  car: volvo, user: maarten, claim: claim6, price_cents: "18500")
part12[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559652924/Foto%27s%20parts/Volvo/s-l1600_dtri73.jpg"
part12.save!

part13 = Part.new(part_model_code: "KD45675X0C", title: "Mazda CX-5 ECU", description: "2.2d ECU 2016", condition: "used", category: "electric",  car: mazda, user: romeo, claim: claim7, price_cents: "23750")
part13[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559653258/Foto%27s%20parts/Mazda/s-l1600_ttrx9g.jpg"
part13.save!

part14 = Part.new(part_model_code: "GHP966DH0F", title: "Mazda CX-5 Electronic Unit (steering)", description: "Electronic steering rack controller 2012 cx-5", condition: "used", category: "electric",  car: mazda, user: romeo, claim: claim7, price_cents: "9550")
part14[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559653591/Foto%27s%20parts/Mazda/s-l1600_nfpu4m.jpg"
part14.save!

part15 = Part.new(part_model_code: "ID-2368", title: "X3 Sunroof Accessories", description: "Panoramic sunroof replacement mechanism bmw x3 2014", condition: "new", category: "electric",  car: bmw, user: nathanael, claim: claim8, price_cents: "6595")
part15[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559653761/Foto%27s%20parts/Bmw/s-l1600_b6gbyy.png"
part15.save!

part16 = Part.new(part_model_code: "7316396", title: "X3 Sunroof Assembly", description: "Panoramic sunroof mechanism for bmw x3 2014", condition: "used", category: "glass", car: bmw, user: nathanael, claim: claim8, price_cents: "64550")
part16[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559653918/Foto%27s%20parts/Bmw/s-l1600_adetdh.jpg"
part16.save!

part17 = Part.new(part_model_code: "8W0941005B", title: "Audi A4 B8 Front Right Headlight", description: "Xenon headlight B8 Audi A4 S-line", condition: "used", category: "lighting", car: audi, user: maarten, claim: claim9, price_cents: "39000")
part17[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559654166/Foto%27s%20parts/Audi/s-l1600_natn2u.jpg"
part17.save!

part18 = Part.new(part_model_code: "8E0821106B", title: "Audi A4 B8 Front Left Fender", description: "color code: LZ9W - black - light scratches near headlight area", condition: "used", category: "body", car: audi, user: maarten, claim: claim9, price_cents: "6850")
part18[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559654509/Foto%27s%20parts/Audi/s-l1600_sri4e4.jpg"
part18.save!

part19 = Part.new(part_model_code: "7700834103", title: "Renault Megane Front Right Door", description: "2006 right front door (LHD car) for renault megane - black", condition: "used", category: "body", car: renault, user: romeo, claim: claim10, price_cents: "14095")
part19[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559654914/Foto%27s%20parts/Renault/s-l1600_eg4lii.jpg"
part19.save!

part20 = Part.new(part_model_code: "EIS48397", title: "Renault Megane Door Lock Mechanism", description: "2006-2009 door lock mechanism - driver side - functioning", condition: "used", category: "electric", car: renault, user: romeo, claim: claim10, price_cents: "3599")
part20[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559655060/Foto%27s%20parts/Renault/s-l1600_usubgb.jpg"
part20.save!

part21 = Part.new(part_model_code: "1S0919275A", title: "PDC Sensor Seat Ibiza", description: "VW/Audi/Seat PDC sensor - like new", condition: "used", category: "sensors",  car: seat, user: nathanael, claim: claim11, price_cents: "4250")
part21[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559656224/Foto%27s%20parts/Seat/s-l1600_ibrlpg.jpg"
part21.save!

part22 = Part.new(part_model_code: "6J4807421E", title: "Seat Ibiza Rear Bumper Black", description: "Seat Ibiza Cupra 6J Bumper Black - heavy markings & scratches", condition: "used", category: "electric", car: seat, user: nathanael, claim: claim11, price_cents: "31000")
part22[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559656334/Foto%27s%20parts/Seat/s-l1600_zgxkii.jpg"
part22.save!

part23 = Part.new(part_model_code: "9673773677", title: "Peugeot 208 Alloy", description: "16inch 6Jx16 ET23 - 2012+", condition: "used", category: "wheel",  car: peugeot2, user: maarten, claim: claim12, price_cents: "19000")
part23[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559656577/Foto%27s%20parts/Peugeot2/s-l1600_n0txir.jpg"
part23.save!

part24 = Part.new(part_model_code: "3322937716319", title: "Peugeot 208 Rear Brake Discs", description: "TRW Rear Brake discs fits peugeot 208", condition: "new", category: "other",  car: peugeot2, user: maarten, claim: claim12, price_cents: "9285")
part24[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559656772/Foto%27s%20parts/Peugeot2/s-l1600_kxembx.jpg"
part24.save!

part25 = Part.new(part_model_code: "2534664", title: "F54 Clubman S All4 Front Bumper", description: "F54 front bumber in 'blazing red' for mini cooper s clubman 2015+", condition: "used", category: "body", car: mini, user: romeo, claim: claim13, price_cents: "51000")
part25[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559656897/Foto%27s%20parts/Mini/s-l1600_ojvjcj.jpg"
part25.save!

part26 = Part.new(part_model_code: "9271204", title: "Mini Clubman F54 Front Radiator", description: "Almost new front radiator for clubman s f54 2015+", condition: "used", category: "other",  car: mini, user: romeo, claim: claim13, price_cents: "17900")
part26[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657044/Foto%27s%20parts/Mini/s-l1600_ns8acg.jpg"
part26.save!

part27 = Part.new(part_model_code: "915DE134", title: "Tesla Model S Rear Right Headlight", description: "Perfect condition rear right taillight for Tesla Model S 2014+", condition: "used", category: "lighting", car: tesla, user: nathanael, claim: claim14, price_cents: "62000")
part27[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657211/Foto%27s%20parts/Tesla/s-l1600_makr3f.jpg"
part27.save!

part28 = Part.new(part_model_code: "915DI691", title: "Tesla Model S Tailgate", description: "Tailgate & bootlid for model s p85d - no taillight, glass or mounting kit", condition: "used", category: "body",  car: tesla, user: nathanael, claim: claim14, price_cents: "145000")
part28[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657319/Foto%27s%20parts/Tesla/s-l1600_hn3uxp.jpg"
part28.save!

part29 = Part.new(part_model_code: "1S0807221B", title: "Front Bumper VW Up 2016", description: "Candy White front bumper vw up 2011+", condition: "used", category: "body",  car: volkswagen2, user: maarten, claim: claim15, price_cents: "8900")
part29[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657466/Foto%27s%20parts/Volkswagen2/s-l1600_tllema.jpg"
part29.save!

part30 = Part.new(part_model_code: "1K6955651", title: "Screenwash Pump VW", description: "VW UP 2011+ screenwasher pump", condition: "used", category: "other",  car: volkswagen2, user: maarten, claim: claim15, price_cents: "2299")
part30[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657703/Foto%27s%20parts/Volkswagen2/s-l1600_fvdcre.jpg"
part30.save!

part31 = Part.new(part_model_code: "3M519G444AB", title: "Exhaust Lambda Sensor Ford Focus 2012", description: "2012 Lambda Sensor in useable condition - not refurbished", condition: "used", category: "other",  car: ford, user: romeo, claim: claim16, price_cents: "13295")
part31[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657853/Foto%27s%20parts/Ford/s-l1600_i7sx2c.jpg"
part31.save!

part32 = Part.new(part_model_code: "3M515230UA", title: "Ford Focus 2012 2.0t Full Exhaust", description: "Resonator + midpipes - no header or catalytic converted - needs refurbishing", condition: "used", category: "other",  car: ford, user: romeo, claim: claim16, price_cents: "9250")
part32[:photo] = "https://res.cloudinary.com/dbimnldt2/image/upload/v1559657950/Foto%27s%20parts/Ford/s-l1600_bndaqh.jpg"
part32.save!


puts "Generating new Orders every user gets 2 pending and sold orders...."
order1 = Order.create!(user: nathanael, status: "pending", part: part3)
order2 = Order.create!(user: nathanael, status: "paid", part: part4)
order3 = Order.create!(user: romeo, status: "paid", part: part5)
order4 = Order.create!(user: romeo, status: "pending", part: part6)
order5 = Order.create!(user: gael, status: "pending", part: part7)
order6 = Order.create!(user: gael, status: "paid", part: part31)
order7 = Order.create!(user: gael, status: "paid", part: part8)
order8 = Order.create!(user: maarten, status: "pending", part: part1)
order9 = Order.create!(user: maarten, status: "paid", part: part2)

puts "Done with seeding the whole database"

