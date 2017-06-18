class Organization < ApplicationRecord
  has_many :orgprograms, dependent: :nullify
  has_many :programs_offered, through: :orgprograms, source: :program

  has_many :activities, dependent: :nullify
  has_many :services, dependent: :nullify

  has_secure_password
end
