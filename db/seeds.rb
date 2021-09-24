5.times do |n|
    name = Faker::Name.name
    email = "username#{n+1}@email.org"
    password = "123abc456def"
    user = User.new(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    user.skip_confirmation!
    user.save!
end
   
