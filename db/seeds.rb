# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
Category.destroy_all

categories = Category.create([
  {name: 'Children'},
  {name: 'Families'},
  {name: 'Pregnency and babies'}
])

cats = Cat.create([
  {name: 'Help in a crisis', category: categories[0] },
  {name: 'Assistance with fees', category: categories[0]},
  {name: 'Help in a crisis', category: categories[0]},
  {name: 'Baby Health & Development', category: categories[1]},
  {name: 'Child Health & Development', category: categories[1]},
  {name: 'Child Advocacy', category: categories[1]},
  {name: 'Childcare & Preschool', category: categories[2]},
  {name: 'Supports for Children', category: categories[2]},
  {name: 'Supports for Families', category: categories[2]}
  ])

  Service.create([
    {name: 'a', description: 'b', website:'www', logo: 'www', category_id: 16, cat_id: 19, status: false},
    {name: 'b', description: 'b', website:'www', logo: 'www', category_id: 16, cat_id: 19, status: false},
    {name: 'c', description: 'b', website:'www', logo: 'www', category_id: 16, cat_id: 19, status: false}
    ])
