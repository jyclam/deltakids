class ResourceFilter < ApplicationRecord
  belongs_to :resource
  belongs_to :age_group, optional: true
  belongs_to :resource_topic, optional: true
  belongs_to :resource_location, optional: true
  belongs_to :resource_type, optional: true
end
