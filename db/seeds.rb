# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# HOW TO USE:
# 1) Quit local server
# 2) Execute: rails db:drop db:create db:migrate
# 3) Start local server
# 4) Sign Up a User
# 5) Execute: rails db:seed
# ALL PICTURES WILL BE ASSIGNED TO THE LAST USER


painting_1 = Painting.create(artist: "Edvard Munch", title: "Der Schrei", price_per_day: 50, address: "Berlin Mitte");
painting_2 = Painting.create(artist: "Edvard Munch", title: "LeWagon", price_per_day: 55, address: "Berlin Friedrichshain");
painting_3 = Painting.create(artist: "Edvard Munch", title: "Monday Morning", price_per_day: 60, address: "Berlin Kreuzberg");
painting_4 = Painting.create(artist: "Edvard Munch", title: "Frontend", price_per_day: 65, address: "Berlin Neukölln");
painting_5 = Painting.create(artist: "Edvard Munch", title: "Flashcards", price_per_day: 70, address: "Berlin Spandau");
painting_6 = Painting.create(artist: "Edvard Munch", title: "Moritz", price_per_day: 75, address: "Berlin Pankow");
painting_7 = Painting.create(artist: "Edvard Munch", title: "Mohammad", price_per_day: 80, address: "Berlin Charlottenburg");
painting_8 = Painting.create(artist: "Edvard Munch", title: "Gerwin", price_per_day: 85, address: "Berlin Schöneberg");
painting_9 = Painting.create(artist: "Edvard Munch", title: "Max", price_per_day: 90, address: "Berlin Lichtenstein");


paintings = []

paintings << painting_1
paintings << painting_2
paintings << painting_3
paintings << painting_4
paintings << painting_5
paintings << painting_6
paintings << painting_7
paintings << painting_8
paintings << painting_9

paintings.each do |painting|
  painting.user = User.last
  painting.save!
end
