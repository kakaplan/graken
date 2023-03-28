# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bike.all.update_all(status: "docked", battery: 1.0, mileage: 0)
Card.all.update_all(card_number: 1234567812345678, exp_date: 01-01-2024, cv:123, name:"John Doe")