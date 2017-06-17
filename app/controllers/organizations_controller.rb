class OrganizationsController < ApplicationController
  def new
	@organization = Organization.new
  end

  def create 
	render json: params
  end

end
