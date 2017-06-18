class OrganizationsController < ApplicationController
  def new
	 @services = ['Help in A Crisis', 'Assistance with Fees', 'Baby and Health Development','Child and Health Development', 'Child Advocacy', 'Childcare and Preschool', 'Support for Children', 'Support for families']
	@organization = Organization.new
  end

  def create
	@organization = Organization.new(organ_params)
  # @organization.service_ids = [params[:organization][:service_ids]]

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
    {programs_offered_ids: []},
    :service_ids,
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
