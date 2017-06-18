class Program < ApplicationRecord
  has_many :orgprograms, dependent: :nullify
  has_many :organizers, through: :orgprograms, source: :organization
  has_many :activities, dependent: :destroy

  belongs_to :age_group
end
