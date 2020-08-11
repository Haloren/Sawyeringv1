# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Household.create(name: "FamilyName", email: "email@email.com", password: "password")

Member.create(name: "NameTrue", points: 1, admin: "true")
Member.create(name: "NameFalse", points: 0, admin: "false")

#Everything below this line doesn't work
Chore.create(name: "Chore1", points: 1, description: "Chore1 instructions go here", member_id: 1)
Chore.create(name: "Chore2", points: 2, description: "Chore2 instructions go here", member_id: 1)

MemberChore.create(members_id: 1, chores_id: 1, comment: "Comment about the chore goes here")