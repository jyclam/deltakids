class Category < ApplicationRecord
  has_many :services, dependent: :nullify
  has_many :cats
end
