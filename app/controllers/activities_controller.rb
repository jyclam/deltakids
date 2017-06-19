class ActivitiesController < ApplicationController
	def index
		@events = Event.order('date ASC')
		@activities = Program.all.where(age_group_id: 1)
		@age_groups = AgeGroup.all
	end

	def new
	  @activity = Activity.new
	end

	def create
		# render json: params
		@activity = Activity.new(activity_params)
		@activity.organization_id = session[:org_id]
		if @activity.save
		create_events(@activity.id)
		redirect_to home_path
		else
		render :new
		end
	end

	def filter
		activity_filter = Activity.all
		puts activity_filter.count
		age_group = params[:age_group_id] 
	  if (params[:age_group_id] != 'all')
			activity_filter = activity_filter.where(age_group_id: params[:age_group_id])
			puts activity_filter.count
		end
	  if (params[:city] != 'all') 
			activity_filter = activity_filter.where(city: params[:city])
			puts activity_filter.count
		end
		if (params[:cost] != 'all') 
			activity_filter = activity_filter.where(cost: params[:cost])
			puts activity_filter.count
		end
		if (params[:repeat] != 'all') 
			activity_filter = activity_filter.where(repeat: params[:repeat])
			puts activity_filter.count
		end
		if (params[:activity_id] != 'all') 
			activity_filter = activity_filter.where(id: params[:activity_id])
			puts activity_filter.count
		end
		
		@filtered_events = []
		if activity_filter.count > 0 
			activity_filter.each do |activity| 
				if !activity.events.empty?
					@events.push(activity.events) 
				end
			end
		end

		puts @events.count
		puts @filtered_events
		



		#filters = Event.all

		# if params[:age_group_ids]
		# 	filters = filters.where(age_group_id: params[:age_group_ids])
		# end

		# @resources = []
		# resource_ids = []
		# filters.each do |filter|
		# 	@resources.push(filter.resource) unless resource_ids.include?(filter.resource_id)
		# 	resource_ids.push(filter.resource_id) unless resource_ids.include?(filter.resource_id)
		# end

		render json: params
		# render :index
		# redirect_to @resources
	end


	private

	def create_events(activity_id)
	  event = Event.new
	  repeater = params[:activity][:repeat]
	  if (!repeater)
		e = Event.new(event_params)
		e.activity_id = activity_id
		e.save
	  else
		date_end = Date.parse params[:activity][:date_end]
		date_start = Date.parse params[:activity][:date_start]
		current_date = date_start
		while((current_date + 1.week) <= date_end)
		  current_date = current_date + 1.week
		  e = Event.new(event_params)
		  e.activity_id = activity_id
		  e.date = current_date
		  e.save
		end
	  end
	end


	def activity_params
	  params.require(:activity).permit([
		:name,
		:date_start,
		:date_end,
		:repeat,
		:age_group_id,
		:program_id,
		:organization_id,
		:unit_num,
		:street_address,
		:city,
		:postal_code,
		:contact_name,
		:contact_email,
		:time_start,
		:time_end,
		:cost,
		:registration,
		:description,
		:more_info
	  ])
	end

	def event_params
	  params.require(:activity).permit([
		:name,
		:date,
		:unit_num,
		:street_address,
		:city,
		:postal_code,
		:contact_name,
		:contact_email,
		:time_start,
		:time_end,
	  ])
	end

end
