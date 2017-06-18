class Service < ApplicationRecord
  belongs_to :category
  belongs_to :organization, optional: true
  belongs_to :cat
end
