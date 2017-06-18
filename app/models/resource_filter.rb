class ResourceFilter < ApplicationRecord
  belongs_to :age_group
  belongs_to :resource_topic
  belongs_to :resource_location
  belongs_to :resource_type
end
