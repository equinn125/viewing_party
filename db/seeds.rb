# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user_1 = User.create(email: 'blahblah@test.com', password: 'password1')
@user_2 = User.create(email: 'erin@test.com', password: 'password2')
@user_3 = User.create(email: 'jacq@test.com', password: 'password3')
