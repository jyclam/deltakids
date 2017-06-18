class OrganizationsController < ApplicationController
  def new
	@organization = Organization.new
  end

  def create
	#render json: params
  byebug
	@organization = Organization.new(organ_params)
	if @organization.save
	  # session[:org_id] = @organization.id
	  redirect_to home_path
	else
	  render :new
	end
  end

  private

  def organ_params
	params.require(:organization).permit(
    {:programs_offered_ids => []},
	  :title,
	  :street_address,
	  :unit_num,
	  :postal_code,
	  :city,
	  :age_group,
	  :activity_type,
	  :description,
	  :target_clientelle,
	  :services,
	  :phone_num,
	  :website,
	  :email,
	  :first_name,
	  :last_name,
	  :password,
	  :password_confirmation
	)
  end


end
