class Service < ApplicationRecord
  belongs_to :category
  belongs_to :organization
end
