class Event < ApplicationRecord
  belongs_to :activity

  def full_address
  "#{unit_num} #{street_address} #{city} #{postal_code}"
  end
end
