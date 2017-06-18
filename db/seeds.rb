AgeGroup.destroy_all
Program.destroy_all
Organization.destroy_all
ResourceFilter.destroy_all
ResourceTopic.destroy_all


# create age groups
AgeGroup.create(name: '0 to 5')
AgeGroup.create(name: '6 to 12')

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
ds = data.each_slice(5).to_a

ds[0].each do |row|
  if row[:agencies] != 'undefined'
    if Organization.where(title: row[:agencies]).length < 1
      Organization.create(title: row[:agencies])
    end
  end

  age_group = row[:age_group] == '0-5' ? 1 : 2

  Activity.create(
  name: row[:short_description_that_relate_to_program],
   date_start: Date.current.year,
   date_end: Date.current.year + 1,
   age_group_id: age_group,
   program_id: program_id(row[:"programs_=_activity_type"], age_group),
   contact_phone_num: row[:phone_number] != 'undefined' ? row[:phone_number] : '',
   website: row[:website] != 'undefined' ? row[:website] : '',
   registration:  row[:regstration] == 'Registered' ? true : false ,
   paid:  row[:cost] == 'Paid' ? true : false
   )
end


def program_id type, age_group
  case type
  when 'Arts & Culture'
    if age_group == 1
      1
    else
      6
    end
  when 'Sports'
    if age_group == 1
      2
    else
      7
    end
  when 'Education'
    if age_group == 1
      3
    else
      8
    end
  when 'Parent & Child'
    4
  when 'Childcare & Preschools'
    5
  when 'Community Clubs'
    9
  when 'Childcare'
    10
  else
    puts 'error in program switch case'
  end
end




#  age_group_id: if row[:age_group] == '0-5' 0 else 1 end

# Organization.where(title: 'Clarion Highland Dance Studio').first.id
#
# a = Activity.create(name: 'test', date_start: Date.parse('01/01/2017'), age_group_id:1, program_id: 1, organization_id: 1)
