# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

"cleaning database"

Item.destroy_all
User.destroy_all

puts "creating 10 users"

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "password",
    phone: Faker::PhoneNumber.extension.to_i,
    location: Faker::Address.street_name
  )
  3.times do
    Item.create!(
      name: Faker::Commerce.product_name,
      category: Item::CATEGORIES.sample,
      price: Faker::Commerce.price.to_f,
      description: Faker::Commerce.brand,
      location: Faker::Address.street_name,
      user: user
    )
  end
end

puts "creating 10 items"

puts "finished"
