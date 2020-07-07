# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Ricard Wise', email: Faker::Internet.email)
Group.create(name: "Kari's Group", established: Time.now, description: "This is a test group", books_per_month: 1, minimum_planned_months: 2, maximum_voting_sessions: 2, user: User.first)