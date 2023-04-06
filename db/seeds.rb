# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Bike.all.update_all(status: "docked", battery: 1.0, mileage: 0)
# Station.find_by(identifier: "25").update(longitude:-72.6539609,latitude:42.3320967, theme_name: "Sea turtle")
# Station.find_by(identifier: "32").update(longitude:-72.6280966,latitude:42.3204674, theme_name: "Anglerfish")
# Station.find_by(identifier: "33").update(longitude:-72.652456,latitude:42.3238896, theme_name: "Blue Sea Dragon")
# Station.find_by(identifier: "32").update(longitude:-72.6280966,latitude:42.3204674, theme_name: "Anglerfish")
# Station.find_by(identifier: "31").update(longitude:-72.6713964,latitude:42.3355752, theme_name: "Pufferfish")
# Station.find_by(identifier: "30").update(longitude:-72.6453446,latitude:42.3309173, theme_name: "Stingray")
# Station.find_by(identifier: "29").update(longitude:-72.1528362,latitude:42.3421225, theme_name: "Dolphin")
# Station.find_by(identifier: "28").update(longitude:-72.6264014,latitude:42.3188119, theme_name: "Beluga Whale")
# Station.find_by(identifier: "27").update(longitude:-72.6327103,latitude:42.317284, theme_name: "starfish")
# Station.find_by(identifier: "26").update(longitude:-72.634969,latitude:42.3181069, theme_name: "Manatee")
# Station.find_by(identifier: "24").update(longitude:-72.6680437,latitude:42.3350036, theme_name: "Shark")
# Station.find_by(identifier: "23").update(longitude:-72.635669,latitude:42.3167667, theme_name: "Clownfish")
# Station.find_by(identifier: "22").update(longitude:-72.6502395 ,latitude:42.3276837, theme_name: "Octopus")
# Station.find_by(identifier: "21").update(longitude:-72.6741444 ,latitude:42.3355744, theme_name: "jellyfish")
# Station.find_by(identifier: "20").update(longitude:-72.6475013 ,latitude:42.3126462, theme_name: "seahorses")

User.all.update_all(admin: false)