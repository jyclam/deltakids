



Cat.destroy_all
Category.destroy_all

ResourceFilter.delete_all
ResourceType.delete_all
ResourceLocation.delete_all
ResourceTopic.delete_all
Program.destroy_all
AgeGroup.delete_all
Resource.delete_all

Organization.destroy_all

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

# create programs
programs = Program.create([
  {category: 'Arts & Culture', age_group_id: 1},
  {category: 'Sports', age_group_id: 1},
  {category: 'Education', age_group_id: 1},
  {category: 'Parent & Child', age_group_id: 1},
  {category: 'Childcare & Preschools', age_group_id: 1},
  {category: 'Arts & Culture', age_group_id: 2},
  {category: 'Sports', age_group_id: 2},
  {category: 'Education', age_group_id: 2},
  {category: 'Community Clubs', age_group_id: 2},
  {category: 'Childcare', age_group_id: 2}
  ])

# create organizations from programs.csv

data = SmarterCSV.process('programs.csv')

data.each do |row|
  if row[:agencies] != 'undefined'
    if Organization.where(title: row[:agencies]).length < 1
      Organization.create(title: row[:agencies])
    end
  end
end

# data = SmarterCSV.process('programs.csv')
# ds = data.each_slice(5).to_a
#
# ds[0].each do |row|
#   if row[:agencies] != 'undefined'
#     if Organization.where(title: row[:agencies]).length < 1
#       Organization.create(title: row[:agencies])
#     end
#   end
#
#   age_group = row[:age_group] == '0-5' ? 1 : 2
#
#   Activity.create(
#   name: row[:short_description_that_relate_to_program],
#    date_start: Date.current.year,
#    date_end: Date.current.year + 1,
#    age_group_id: age_group,
#    program_id: program_id(row[:"programs_=_activity_type"], age_group),
#    contact_phone_num: row[:phone_number] != 'undefined' ? row[:phone_number] : '',
#    website: row[:website] != 'undefined' ? row[:website] : '',
#    registration:  row[:regstration] == 'Registered' ? true : false ,
#    paid:  row[:cost] == 'Paid' ? true : false
#    )
# end
#
#
# def program_id type, age_group
#   case type
#   when 'Arts & Culture'
#     if age_group == 1
#       1
#     else
#       6
#     end
#   when 'Sports'
#     if age_group == 1
#       2
#     else
#       7
#     end
#   when 'Education'
#     if age_group == 1
#       3
#     else
#       8
#     end
#   when 'Parent & Child'
#     4
#   when 'Childcare & Preschools'
#     5
#   when 'Community Clubs'
#     9
#   when 'Childcare'
#     10
#   else
#     puts 'error in program switch case'
#   end
# end
