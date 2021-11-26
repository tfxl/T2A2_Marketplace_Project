# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Meetup.destroy_all
Offer.destroy_all
Listing.destroy_all
Board.destroy_all
User.destroy_all
Address.destroy_all
Postcode.destroy_all

# User.create!(
#   [
#     {
#       email: "bobby@abc.com", 
#       password: "123456", 
#       first_name: "Bobby", 
#       phone: "0400999111"
#     },
#     {
#       email: "janey@abc.com", 
#       password: "123456", 
#       first_name: "Janey", 
#       phone: "0400999222"
#     },
#     {
#       email: "yogo@abc.com", 
#       password: "123456", 
#       first_name: "Yogi", 
#       phone: "0400999333"
#     }
#   ]
# )

bobby = User.create!(email: "bobby@abc.com", password: "123456", first_name: "Bobby", phone: "0400999111")
janey = User.create!(email: "janey@abc.com", password: "123456", first_name: "Jane", phone: "0400999222")
yogi = User.create!(email: "yogo@abc.com", password: "123456", first_name: "Yogi", phone: "0400999333")



Board.create!(
  [
    { 
      designer: "South Bay Board Co",
      description: "A board to be swapped", 
      length: 220, 
      width: 48, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available",
      user: bobby, 
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_blue.webp")), filename: "default_image" } 
    },
    { 
      designer: "Chilli",
      description: "A board to be swapped",  
      length: 220, 
      width: 48, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available",
      user: bobby,
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_grey.jpg")), filename: "default_image" }
    },
    { 
      designer: "Firewire",
      description: "A board to be swapped",  
      length: 280, 
      width: 50, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available",
      user: bobby,
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_orange.png")), filename: "default_image" }
    },
    { 
      designer: "Ripcurl",
      description: "A board to be swapped",  
      length: 240, 
      width: 48, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available", 
      user: janey,
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_red.png")), filename: "default_image" }
    },
    { 
      designer: "Channel Islands",
      description: "A board to be swapped",  
      length: 220, 
      width: 48, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available",
      user: janey,
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_white.webp")), filename: "default_image" }
    }, 
    { 
      designer: "JS Industries",
      description: "A board to be swapped",  
      length: 220, 
      width: 48, 
      fins: 'Thruster', 
      condition: 'Great',
      status: "Available",
      user: yogi,
      board_image: {io: File.open(File.join(Rails.root, "/db/seedfile_images/board_yellow.webp")), filename: "default_image" } 
    }
  ]
)

# b.board_image.attach(io: File.open(File.join(Rails.root, "/db/seed_pics/img2.jpg")), filename: "default_image" )
# Board.create!(designer: "Ripcurl", length: 240, width: 48, fins: 'Thruster', condition: 'Great', user: janey)
# Board.create!(designer: "Channel Islands", length: 220, width: 48, fins: 'Thruster', condition: 'Great', user: janey)

# Board.create!(designer: "JS Industries", length: 220, width: 48, fins: 'Thruster', condition: 'Great', user: yogi)

# Port Macquarie
# Coffs Harbour
# Ballina



Address.create!(
  [
    { name: "Torquay SLSC", 
      suburb: "Torquay",
      street_number: "55",
      street_name: "Surf Beach Drive",
      website_main: "https://torquayslsc.com.au/",
      website_menu: "none provided",
      postcode: Postcode.create!(number: 3228, state: "VIC", country: "Australia")
    },
    {
      name: "Lakes Entrance SLSC", 
      suburb: "Lakes Entrance",
      street_number: "426A",
      street_name: "Main Beach Walk",
      website_main: "https://www.lakesentrancesurflifesaving.org.au/",
      website_menu: "none provided",
      postcode: Postcode.create!(number: 3909, state: "VIC", country: "Australia")
    },
    { name: "Wollongong City SLSC", 
      suburb: "Wollongong",
      street_number: "1",
      street_name: "Marine Parade",
      website_main: "https://www.wollongongcityslsc.com.au/",
      website_menu: "none provided",
      postcode: Postcode.create!(number: 2520, state: "NSW", country: "Australia")
    },
    {
      name: "Nobbys SLSC", 
      suburb: "Newcastle",
      street_number: "35",
      street_name: "Nobbys Road",
      website_main: "https://www.nobbysnsw.com.au/",
      website_menu: "none provided",
      postcode: Postcode.create!(number: 2300, state: "NSW", country: "Australia")
    },
    {
      name: "Kirra SLSC", 
      suburb: "Coolangatta",
      street_number: "15",
      street_name: "Marine Parade",
      website_main: "https://www.nobbysnsw.com.au/",
      website_menu: "https://www.kirrabeachsurfclub.com/menu", 
      postcode: Postcode.create!(number: 4225, state: "QLD", country: "Australia")
    },
    {
      name: "Southport SLSC", 
      suburb: "Main Beach",
      street_number: "3608",
      street_name: "Macarthur Parade",
      website_main: "https://sslsc.com.au/",
      website_menu: "https://sslsc.com.au/wp-content/uploads/2020/08/Restaurant-Breakfast-Menu-1.pdf", #multi menus
      postcode: Postcode.create!(number: 4217, state: "QLD", country: "Australia")
    },
    {
      name: "Mooloolaba SLSC", 
      suburb: "Mooloolaba",
      street_number: "1",
      street_name: "The Esplanade",
      website_main: "https://mooloolabaslsc.com.au/",
      website_menu: "https://www.thesurfclub.com.au/wp-content/uploads/2021/10/Boathouse-All-Day-Dining-Menu-Kitchen-7.10.21.jpg", #multi menus
      postcode: Postcode.create!(number: 4557, state: "QLD", country: "Australia")
    },
    {
      name: "Yeppoon SLSC", 
      suburb: "Yeppoon",
      street_number: "74",
      street_name: "Anzac Parade",
      website_main: "https://www.yeppoonslsc.com.au/",
      website_menu: "https://www.zmenu.com/poppies-beachside-yeppoon-qld-online-menu/", #multi menus
      postcode: Postcode.create!(number: 4703, state: "QLD", country: "Australia")
    }
  ]
)

# Book.create!(title: "Harry Potter", author: jkr, publisher: "Penguin", date_published: "2021-10-26", genres: [genres[0]], status: "in_stock")

puts "#{User.count}/3 users were created"
puts "#{Postcode.count}/8 postcodes were created"
puts "#{Address.count}/8 addresses were created"
puts "#{Board.count}/6 boards were created"