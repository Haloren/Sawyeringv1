# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Household.create(name: "FamilyName", email: "email@email.com", password: "password")

Member.create(name: "NameTrue", points: 1, admin: true, password: "password", household_id: Household.first.id)
Member.create(name: "NameFalse", points: 0, admin: false, password: "password", household_id: Household.first.id)

Chore.create(name: "Chore1", points: 1, description: "Chore1 instructions go here", member_id: Member.first.id)
Chore.create(name: "Chore2", points: 2, description: "Chore2 instructions go here", member_id: Member.first.id)

MemberChore.create(member_id: 1, chore_id: 1, comment: "Comment about the chore goes here")