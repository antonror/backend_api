10.times do
  name = Faker::Pokemon.name
  move = Faker::Pokemon.move
  Pokemon.create!(title: name, body: move)
end
