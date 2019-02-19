# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
10.times do
 n = 1
 n+=1
  user = User.new(encrypted_password:"201030",first_name:Faker::GameOfThrones.character,last_name: Faker::Name.last_name, email: Faker::Internet.email,description: Faker::HarryPotter.quote)
  user.save
    
 #event=Event.create(location:Faker::HarryPotter.location,description:Faker::GameOfThrones.quote,price:Faker::Number.between(1,1000),duration:"45",start_date:"02-02-2012",user:User.find(1))
 end