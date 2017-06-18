class AgeGroup < ApplicationRecord
  has_many :activites, dependent: :nullify

  has_many :programs, dependent: :destroy 
end
