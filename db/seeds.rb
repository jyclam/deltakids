# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resource.create(
  {name: 'First Resource'}
)

ResourceType.create([
  {name: 'Tip & Guidelines'},
  {name: 'Research'},
  {name: 'Report'}
])

AgeGroup.create([
  {name: '0-5 years'},
  {name: '6-12 years'},
  {name: 'Not applicable'}
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

  ResourceFilter.create([
      {
      resource_id: 1, 
      age_group_id: 1,
      resource_topic_id: 1,
      resource_location_id: 1,
      resource_type_id: 1}
    ])
