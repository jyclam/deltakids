class Organization < ApplicationRecord
  has_secure_password

  has_many :orgprograms, dependent: :nullify
  has_many :programs_offered, through: :orgprograms, source: :program

  has_many :activities, dependent: :nullify

end
