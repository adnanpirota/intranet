User.create!(emri: "Adnan Pirota",
             emaili: "adnan.pirota2@devollicorporation.com",
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