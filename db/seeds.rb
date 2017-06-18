# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {name: 'Children'},
  {name: 'Families'},
  {name: 'Pregnency and babies'}
])

cats = Cat.create([
  {name: 'Help in a crisis'},
  {name: 'Assistance with fees'},
  {name: 'Help in a crisis'},
  {name: 'Baby Health & Development'},
  {name: 'Child Health & Development'},
  {name: 'Child Advocacy'},
  {name: 'Childcare & Preschool'},
  {name: 'Supports for Children'},
  {name: 'Supports for Families'}
  ])
