class AgeGroup < ApplicationRecord
  has_many :activites, dependent: :nullify
end
