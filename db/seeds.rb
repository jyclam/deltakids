Service.destroy_all
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
Activity.destroy_all
Event.destroy_all

categories = Category.create([
  {name: 'Children'},
  {name: 'Families'},
  {name: 'Pregnency and babies'}
])


cats = Cat.create([
  {name: 'Help in a crisis', category: categories[0] },
  {name: 'Child Advocacy', category: categories[0] },
  {name: 'Child Health & Development', category: categories[0]},
  {name: 'Supports for Children', category: categories[0]},
  {name: 'Help in a Crisis', category: categories[1]},
  {name: 'Childcare & Preschool', category: categories[1]},
  {name: 'Assistance with fees', category: categories[1]},
  {name: 'Supports for Families', category: categories[1]},
  {name: 'Help in a Crisis', category: categories[2]},
  {name: 'Baby Health & Development', category: categories[2]},
  {name: 'Supports for Families', category: categories[2]}
  ])








ResourceFilter.delete_all
ResourceType.delete_all
ResourceLocation.delete_all
ResourceTopic.delete_all
AgeGroup.delete_all
Resource.delete_all




# age group seed
agegroups = AgeGroup.create([
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
cities = ['North Delta', 'South Delta', 'Surrey']

data = SmarterCSV.process('programs.csv')
ds = data.each_slice(5).to_a

data.each do |row|
  if row[:agencies]
    if Organization.where(title: row[:agencies]).length < 1
      Organization.create(
      title: row[:agencies],
      password_digest: '123',
      target_clientelle: categories.sample.name,
      phone_num: row[:phone_number] ? row[:phone_number] : "#{Faker::PhoneNumber.phone_number}",
      services: cats.sample.name,
      age_group: agegroups.sample.name,
      website: row[:website] ? row[:website] : Faker::Internet.url,
      unit_num: rand(1111..9999),
      street_address: row[:address] ? row[:address] : Faker::Address.street_name ,
      city: cities.sample,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: row[:short_description_that_relate_to_program] ? row[:short_description_that_relate_to_program] : Faker::Hipster.paragraph(1),
      email: Faker::Internet.email(row[:agencies])
      )
    end
  end
end

50.times do
  Service.create name: Faker::Company.name,
                description: Faker::Hipster.paragraph,
                website: Faker::Internet.url,
                logo: Faker::Internet.url,
                category_id: categories.sample.id,
                cat_id: cats.sample.id,
                status: [false, true].sample,
                organization_id: Organization.all.sample.id
end

50.times do
	a = Activity.create(
		name: ['Summer Basketball with Michael Jordan', 'Winter Hockey with Wayne Gretzsky', 'Drawing with Pablo Picasso', 'Singing with Celine Dion', 'Learning About Space with Neil Degrasse Tyson', 'Cooking with Ratatouille'].sample,
		date_start: ["2018-01-#{rand(1..29)}", "2018-02-#{rand(1..29)}"].sample,
		date_end: ["2018-03-#{rand(1..29)}", "2018-04-#{rand(1..29)}"].sample,
	  repeat: [true, false].sample,
	  street_address: ['4838 Clinton St.', '4-565 Shaw Ave.', '911 Emergency Lane'].sample,
	  city: ['Ladner', 'Tsawwassen', 'North Delta'].sample,
		unit_num: ['1', '2', '3', '4', '5'].sample,
	  postal_code: ['V5K 2K9', 'V5B 1W8'].sample,
	  contact_name: ['Jon Snow', 'Dany Targaryen', 'Tyrion Lannister'].sample,
	  contact_email: ['important_person@gmail.com', 'vip@vip.com', 'happyman@heaven.ca'].sample,
	  time_start: ['12:00', '3:00', '6:00'].sample,
	  time_end: ['7:00', '8:00', '9:00'].sample,
	  website: ['https://www.google.com', 'https://amazon.com', 'https://deltakids.ca'].sample,
	  cost: ['free', 'low', 'paid'].sample,
	  description: ['last night I had a dream, about a dream, about you!', 'if they come for you, i will field their questions, i will shield your name', 'foot on the devils neck till they drift to pangea, im moving all my family to chadman to zambia'].sample,
	  more_info: ['', 'come and have some fun!!', 'you will grow and learn', 'be like water my friends'].sample,
		age_group_id: AgeGroup.all.sample.id,
		program_id: Program.all.sample.id,
		organization_id: Organization.all.sample.id
   )
end

50.times do
	e = Event.create(
		name: ['Summer Basketball with Michael Jordan', 'Winter Hockey with Wayne Gretzsky', 'Drawing with Pablo Picasso', 'Singing with Celine Dion', 'Learning About Space with Neil Degrasse Tyson', 'Cooking with Ratatouille'].sample,
		date: ["2018-01-#{rand(1..29)}", "2018-02-#{rand(1..29)}"].sample,
		unit_num: ['1', '2', '3', '4', '5'].sample,
	  street_address: ['4838 Clinton St.', '4-565 Shaw Ave.', '911 Emergency Lane'].sample,
	  city: ['Ladner', 'Tsawwassen', 'North Delta'].sample,
	  postal_code: ['V5K 2K9', 'V5B 1W8'].sample,
	  contact_name: ['Jon Snow', 'Dany Targaryen', 'Tyrion Lannister'].sample,
	  contact_email: ['important_person@gmail.com', 'vip@vip.com', 'happyman@heaven.ca'].sample,
	  time_start: ['12:00', '3:00', '6:00'].sample,
	  time_end: ['7:00', '8:00', '9:00'].sample,
		activity_id: Activity.all.sample.id
   )
end

# services = Service.create([
#   {name: 'a', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'b', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id},
#   {name: 'c', description: 'b', website:'www', logo: 'www', category_id: categories.sample.id, cat_id: cats.sample.id, status: false, organization_id: Organization.all.sample.id}
#   ])



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
