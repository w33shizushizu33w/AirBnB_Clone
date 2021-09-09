2.times do |n|
    name = Faker::Name.name
    email = "username#{n+1}@email.org"
    password = "123abc456def"
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)

end   
