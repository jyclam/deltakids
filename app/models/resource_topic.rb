class ResourceTopic < ApplicationRecord
  has_many :resource_filters, dependent: :nullify
end
