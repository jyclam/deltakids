class SessionsController < ApplicationController
  
  def new
  end

  def create 
	organization = Organization.find_by(email: params[:email])

	if organization&.authenticate(params[:password]) 
	  session[:org_id] = organization.id
	  redirect_to home_path 
	else 
	  render :new 
	end
  end

  def destroy
	session[:org_id] = nil 
	redirect_to home_path
  end


end
