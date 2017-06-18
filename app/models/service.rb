class Service < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :organization, optional: true
end
