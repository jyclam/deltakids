class Organization < ApplicationRecord
  has_secure_password

  has_many :orgprograms, dependent: :nullify
  has_many :programs_offered, through: :orgprograms, source: :program

  has_many :activities, dependent: :nullify

  def full_address
    "#{unit_num} #{street_address} #{city} #{postal_code}"
  end
end
