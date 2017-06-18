class Resource < ApplicationRecord
  has_many :resource_filters, dependent: :destroy
end
