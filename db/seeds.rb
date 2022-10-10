# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Billy', email: 'billy01@gmail.com', password: '@edd12345', photo: 'shrtco.de/do7AF4', bio: 'Teacher from Holand.')
second_user = User.create(name: 'Lilly', email: 'lilly01@gmail.com', password: '@sam12345', photo: 'shrtco.de/do7AF4', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Chris', email: 'chris01@gmail.com', password: '@chris12345', photo: 'shrtco.de/do7AF4', bio: 'Teacher from London.')
fourth_user = User.create(name: 'Kim', email: 'kim01@gmail.com', password: '@kim12345', photo: 'shrtco.de/do7AF4', bio: 'Teacher from Kenya.')
