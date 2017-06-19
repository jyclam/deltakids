class Event < ApplicationRecord
  belongs_to :activity

	def start_time 
		Time.zone.parse(self.date + ' ' + self.time_start)
	end

  def full_address
  "#{unit_num} #{street_address} #{city} #{postal_code}"
  end
end
