# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(emri: "Adnan Pirota",
             emaili: "adnan.pirota@devollicorporation.com",
            password: "MY4zrg22",
            password_confirmation: "MY4zrg22",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
            
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@devollicorporation.com"
  password = "password"
  User.create!(emri: name,
              emaili: email, 
              password:               password,
              password_confirmation:  password,
              activated: true,
              activated_at: Time.zone.now)
end
