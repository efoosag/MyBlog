# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(name: 'Victor', email: 'victor@gmail.com', password: 'victor12345', photo: 'shrtco.de/do7AF4', bio: 'Teacher from Holand.', role: 'admin')
