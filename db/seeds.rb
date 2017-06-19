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

Category.create([
  {name: 'Children'},
  {name: 'Families'},
  {name: 'Pregnancy and babies'}
])
categories = Category.all

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


# age group seed
AgeGroup.create([
  {name: '0-5 years'},
  {name: '6-12 years'},
  {name: 'Not applicable'}
  ])
agegroups = AgeGroup.all

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
Program.create([
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
programs = Program.all

# create organizations from programs.csv
# admin organization:
Organization.create(title:'Kids Delta Admin', email:'123@123.com', password:'123', is_admin:true)
cities = ['North Delta', 'South Delta', 'Surrey']

data = SmarterCSV.process('programs.csv')
ds = data.each_slice(5).to_a

data.each do |row|
  if row[:agencies]
    if Organization.where(title: row[:agencies]).length < 1
      Organization.create(
      title: row[:agencies],
      password: '123',
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
organizations = Organization.all

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

15.times do
	a = Activity.create(
		name: ['Summer Basketball with Michael Jordan', 'Winter Hockey with Wayne Gretzsky', 'Drawing with Pablo Picasso', 'Singing with Celine Dion', 'Learning About Space with Neil Degrasse Tyson', 'Cooking with Ratatouille', 'Frolicking With Forrest Gump'].sample,
		date_start: Date.new(2017, rand(1..6), rand(1..15)),
		date_end: Date.new(2017, (rand(1..6) + 6), (rand(1..15) + 15)),
	  repeat: [true, false].sample,
	  street_address: ['4838 Clinton St.', '4-565 Shaw Ave.', '911 Emergency Lane'].sample,
	  city: ['Ladner', 'Tsawwassen', 'North Delta'].sample,
		unit_num: ['1', '2', '3', '4', '5'].sample,
	  postal_code: ['V5K 2K9', 'V5B 1W8'].sample,
	  contact_name: ['Jon Snow', 'Dany Targaryen', 'Tyrion Lannister'].sample,
	  contact_email: ['important_person@gmail.com', 'vip@vip.com', 'happyman@heaven.ca'].sample,
		contact_phone_num: ['604-956-9129', '778-918-4521', '604-945-5226'].sample,
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
	if a.repeat == false
		e = Event.new(
			name: a.name,
			date: a.date_start,
      unit_num: a.unit_num,
			street_address: a.street_address,
			city: a.city,
			postal_code: a.postal_code,
			contact_name: a.contact_name,
			contact_email: a.contact_email,
		  contact_phone_num: ['604-956-9129', '778-918-4521', '604-945-5226'].sample,
			time_start: a.time_start,
			time_end: a.time_end,
			activity_id: a.id,
      is_approved: [true,false].sample
		)
		e.save
	else
		date_end = a.date_end
		date_start = a.date_start
		current_date = date_start
		while ((current_date + 1.week) <= date_end)
			current_date += 1.week
			e = Event.new(
				name: a.name,
				date: current_date,
				unit_num: a.unit_num,
				street_address: a.street_address,
				city: a.city,
				postal_code: a.postal_code,
				contact_name: a.contact_name,
				contact_email: a.contact_email,
				time_start: a.time_start,
				time_end: a.time_end,
				activity_id: a.id,
        is_approved: [true,false].sample
			)
			e.save
		end
	end
end
