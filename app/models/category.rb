class Category < ApplicationRecord
  has_many :services, dependent: :nullify
end
