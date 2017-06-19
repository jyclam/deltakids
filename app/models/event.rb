class Event < ApplicationRecord
  belongs_to :activity

	def start_time 
		Time.zone.parse(self.date + ' ' + self.time_start)
	end

end
