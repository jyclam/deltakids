class ActivitiesController < ApplicationController
	def index

	end

	def new 
	  @activity = Activity.new
	end

	def create
	  render json: params
	end


end
