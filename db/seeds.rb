# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(first_name: "admin", last_name: "user", password: "password", phone: "555-555-1212", email: "admin@test.com")
User.create!(first_name: "user", last_name: "name", password: "password", phone: "555-555-1212", email: "user@test.com")