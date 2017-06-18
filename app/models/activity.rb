class Activity < ApplicationRecord
  belongs_to :age_group
  belongs_to :program
  belongs_to :organization

  has_many :events, dependent: :destroy

end
