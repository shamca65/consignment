# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
FactoryBot.define do
  factory :customer do
    first_name 'John'
    last_name  'Doe'
    email 'user@test.com'
    phone '555-555-1212'
    active false
    street_address '123 Anywhere St'
    city 'london'
    postal 'N6A2B1'
    acct_open_date Date.today
    trans_type 0
    agreement_status 0
  end
end

@customer = FactoryBot.build(:customer)

#AdminUser.create!(first_name: "admin", last_name: "user", password: "password", phone: "555-555-1212", email: "admin@test.com")
#User.create!(first_name: "user", last_name: "name", password: "password", phone: "555-556-1212", email: "user@test.com")

#Customer.create!(first_name: "2-Biff", last_name: "McCarter", email: "biff@anus.com", phone: "555-555-1212")
#Customer.create!(first_name: "3-Chiff", last_name: "McBarter", email: "chiff@anus.com", phone: "555-555-1212")
#Customer.create!(first_name: "4-Whiff", last_name: "McFarter", email: "whiff@anus.com", phone: "555-555-1212")

Item.create!(size: 0, description: "Customer-1", customer_id: 4, price: "12.34")

Item.create!(size: 0, description: "Customer-2", customer_id: 5, price: "12.34")
Item.create!(size: 0, description: "Customer-2", customer_id: 5, price: "12.34")

Item.create!(size: 0, description: "Customer-3", customer_id: 6, price: "12.34")
Item.create!(size: 0, description: "Customer-3", customer_id: 6, price: "12.34")
Item.create!(size: 0, description: "Customer-3", customer_id: 6, price: "12.34")

Item.create!(size: 1, description: "Customer-4", customer_id: 7, price: "12.34")
Item.create!(size: 1, description: "Customer-4", customer_id: 7, price: "12.34")
Item.create!(size: 1, description: "Customer-4", customer_id: 7, price: "12.34")
Item.create!(size: 1, description: "Customer-4", customer_id: 7, price: "12.34")

Item.create!(size: 1, description: "Customer-5", customer_id: 8, price: "12.34")
Item.create!(size: 1, description: "Customer-5", customer_id: 8, price: "12.34")
Item.create!(size: 1, description: "Customer-5", customer_id: 8, price: "12.34")
Item.create!(size: 1, description: "Customer-5", customer_id: 8, price: "12.34")
Item.create!(size: 1, description: "Customer-5", customer_id: 8, price: "12.34")
