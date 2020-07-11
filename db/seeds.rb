# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Ricard Wise', email: Faker::Internet.email)
User.create(name: 'Sarah Wise', email: Faker::Internet.email)
User.create(name: 'Allen Keen', email: Faker::Internet.email)
User.create(name: 'Alina Keen', email: Faker::Internet.email)
Group.create(name: "Cari's Group", established: Time.now, description: "This is a test group", books_per_month: 1, minimum_planned_months: 2, maximum_voting_sessions: 2, user: User.first)
Group.create(name: "Testing Group", established: Time.now, description: "This is a test group", books_per_month: 1, minimum_planned_months: 2, maximum_voting_sessions: 2, user: User.first)
Group.create(name: "Special Group", established: Time.now, description: "This is a test group", books_per_month: 1, minimum_planned_months: 2, maximum_voting_sessions: 2, user: User.first)

User.all.each do |user|
  Membership.create(user_id: user.id, group: Group.first, role: 'admin')
end
Membership.create(user: User.first, group: Group.find(2), role: 'admin')
Membership.create(user: User.first, group: Group.last, role: 'admin')