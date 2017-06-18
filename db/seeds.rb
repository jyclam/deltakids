# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
Category.destroy_all
ResourceFilter.delete_all
ResourceType.delete_all
ResourceLocation.delete_all
ResourceTopic.delete_all
AgeGroup.delete_all
Resource.delete_all

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



# age group seed
AgeGroup.create([
  {name: '0-5 years'},
  {name: '6-12 years'},
  {name: 'Not applicable'}
  ])


# resource seeds
def generateResourceDescription
  body = ''
  rand(1..2).times do
    rand(1..2).times do
      body += "&nbsp;&nbsp;"
      body += "#{Faker::HarryPotter.quote} "
      body += "#{Faker::ChuckNorris.fact} "
      body += "#{Faker::Hacker.say_something_smart} "
    end
    body += "<br />"
  end
  return body
end


50.times do
  Resource.create name: Faker::Hacker.say_something_smart,
                  feature:  true,
                  start_date: Faker::Date.backward(rand(20)),
                  end_date: Faker::Date.forward(rand(20)),
                  description: generateResourceDescription,
                  contact_name: Faker::Name.name,
                  contact_email: Faker::Internet.email
end

ResourceType.create([
  {name: 'Tip & Guidelines'},
  {name: 'Research'},
  {name: 'Report'}
])

ResourceLocation.create([
  {location: 'Delta'},
  {location: 'BC'},
  {location: 'Canada'}
  ])


ResourceTopic.create([
  {name: 'Physical Health'},
  {name: 'Mental Health'},
  {name: 'Child Development'},
  {name: 'Policy'},
  {name: 'Child Safety'}
  ])


resource_types = ResourceType.all
resource_locations = ResourceLocation.all
resource_topics = ResourceTopic.all
resource_age_groups = AgeGroup.all
resources = Resource.all

resources.each do |resource|
  type = resource_types.sample
  location = resource_locations.sample
  resource_topics.each do |topic|
    if [true, false].sample
      resource_age_groups.each do |age_group|
        if[true, false].sample
          ResourceFilter.create([
              {
              resource: resource,
              age_group: age_group,
              resource_topic: topic,
              resource_location: location,
              resource_type: type}
            ])
        end
      end
    end
  end
end
