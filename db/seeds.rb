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
data.each do |row|
  if row[:agencies] != 'undefined'
    if Organization.where(title: row[:agencies]).length < 1
      Organization.create(title: row[:agencies])
    end
  end
  if row[:age_group] == '0-5'
    Activity.create(name: row[:short_description_that_relate_to_program], date_start)
end

# Organization.where(title: 'Clarion Highland Dance Studio').first.id

# a = Activity.create(name: 'test', date_start: Date.parse('01/01/2017'), age_group_id:1, program_id: 1, organization_id: 1)
